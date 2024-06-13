import { colors } from "../utils/colors.js";

/**
 * @template T
 * @typedef {T | import("types/service").Binding<any, any, T>} Prop
 */

/**
 * @typedef {import('types/@girs/gtk-3.0/gtk-3.0').default.Widget} Widget
 */

/**
 * @typedef {Object} CardProps
 * @property {Prop<Widget[]>} [children]
 */

/**
 * @param {CardProps} params
 */
function Card(params) {
	return Widget.Box({
		css: `background-color: ${colors.base00}; border-radius: 10px;`,
		children: params.children,
	});
}

export { Card };
