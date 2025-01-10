import type Binding from "astal/binding";
import type { Subscribable } from "astal/binding";

type Prop<T> = T | Binding<T>;

function isPropBinding<T>(prop: Prop<T>): prop is Binding<T> {
	return (
		typeof prop === "object" &&
		prop !== null &&
		"get" in prop &&
		"subscribe" in prop
	);
}

function propToSubscribable<T>(prop: Prop<T>): Subscribable<T> {
	if (isPropBinding(prop)) {
		return prop;
	}
	return {
		get: () => prop,
		subscribe: () => () => {},
	};
}

function transProp<T, U>(prop: Prop<T>, f: (t: T) => U): Prop<U> {
	if (isPropBinding(prop)) {
		return prop.as(f);
	}
	return f(prop);
}

export { propToSubscribable, transProp, type Prop };
