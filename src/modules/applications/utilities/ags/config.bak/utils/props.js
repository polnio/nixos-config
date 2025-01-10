/**
 * @template T
 * @typedef {T | import("types/service").Binding<any, any, T>} Prop
 */

/**
 * @template T
 * @template P extends Prop<T>
 * @param {P} prop
 * @returns {prop is import('types/service').Binding<T>}
 */
function propIsBinding(prop) {
	return typeof prop === "object" && prop !== null && "as" in prop;
}

/**
 * @template T
 * @template U
 * @param {Prop<T>} prop
 * @param {(value: T) => U} trans
 * @returns {Prop<U>}
 */
function transProp(prop, trans) {
	if (propIsBinding(prop)) {
		return prop.as(trans);
	}
	return trans(prop);
}

/**
 * @template T
 * @param {Prop<T>} prop
 * @returns {import('types/variable').Variable<T>}
 */
function propToVariable(prop) {
	const variable = Variable(
		propIsBinding(prop) ? prop.transformFn(prop.emitter[prop.prop]) : prop,
	);

	if (propIsBinding(prop)) {
		prop.emitter.connect(`notify::${prop.prop}`, (value) => {
			variable.value = prop.transformFn(value[prop.prop]);
		});
	}

	return variable;
}

export { propIsBinding, transProp, propToVariable };
