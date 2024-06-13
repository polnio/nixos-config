/**
 * @template T
 * @typedef {T | import("types/service").Binding<any, any, T>} Prop
 */

import { propToVariable, transProp } from "../utils/props.js";

/**
 * @typedef {ReturnType<import("./block").Block>} Block
 */

/**
 * @typedef {import('types/@girs/gtk-3.0/gtk-3.0').default.Widget} Widget
 */

/**
 * @typedef {Object} BlockGroupProps
 * @property {Prop<boolean> | undefined} [visible]
 * @property {Prop<number> | undefined} [spacing]
 * @property {Prop<number> | undefined} [marginRight]
 * @property {Prop<Widget[]> | ((isHovered: import('types/variable').Variable<boolean>) => Prop<Widget[]>)} children
 */

/**
 * @param {BlockGroupProps} props
 */
function HoverGroup(props) {
	const isHovered = Variable(false);
	const spacing = propToVariable(props.spacing);
	return Widget.EventBox({
		visible: props.visible ?? true,
		marginEnd: props.marginRight ?? 0,
		onHover: () => isHovered.setValue(true),
		onHoverLost: () => isHovered.setValue(false),
		child: Widget.Box({
			// spacing: isHovered.bind().as((isHovered) => (isHovered ? 20 : 0)),
			spacing: Utils.derive([isHovered, spacing], (isHovered, spacing) => {
				if (isHovered) {
					return spacing ?? 20;
				}
				return spacing ?? 0;
			}).bind(),
			/* children: transProp(props.children, (children) =>
				Array.isArray(children) ? children : children(isHovered),
			), */
			children:
				typeof props.children === "function"
					? props.children(isHovered)
					: props.children,
		}),
	});
}

export { HoverGroup };
