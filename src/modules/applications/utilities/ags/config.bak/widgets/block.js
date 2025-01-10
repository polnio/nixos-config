/**
 * @template T
 * @typedef {T | import("types/service").Binding<any, any, T>} Prop
 */

import { propToVariable, transProp } from "../utils/props.js";
import { colors } from "../utils/colors.js";

/**
 * @typedef {Object} BlockProps
 * @property {Prop<string> | undefined} [icon]
 * @property {Prop<string | import("types/@girs/gdkpixbuf-2.0/gdkpixbuf-2.0.js").GdkPixbuf.Pixbuf> | undefined} [iconPath]
 * @property {Prop<string> | undefined} [text]
 * @property {Prop<string> | undefined} [tooltipMarkup]
 * @property {Prop<boolean> | undefined} [collapsed]
 * @property {Prop<string> | undefined} [group]
 * @property {(widget: any, event: any) => void | undefined} [onClick]
 * @property {(widget: any, event: any) => void | undefined} [onRightClick]
 * @property {(widget: any, event: any) => void | undefined} [onRelease]
 * @property {(widget: any, event: any) => void | undefined} [onScroll]
 * @property {Prop<boolean> | undefined} [visible]
 * @property {Prop<string> | undefined} [css]
 * @property {Prop<string> | undefined} [iconCss]
 * @property {Prop<string> | undefined} [textCss]
 * @property {Prop<"first" | "last" | "single" | "none"> | undefined} [position]
 * @property {Prop<number> | undefined} [marginRight]
 * @property {Prop<boolean> | undefined} [hexpand]
 */

/**
 * @param {Prop<string | import("types/@girs/gdkpixbuf-2.0/gdkpixbuf-2.0.js").GdkPixbuf.Pixbuf>} path
 * @param {Prop<string> | undefined} [iconCss]
 */
function IconImage(path, iconCss) {
	return Widget.Icon({
		css: iconCss,
		icon: path,
		size: 20,
		widthRequest: 40,
		heightRequest: 40,
	});
}

/**
 * @param {Prop<string>} text
 * @param {Prop<string> | undefined} [iconCss]
 */
function IconText(text, iconCss) {
	return Widget.Label({
		css: iconCss,
		widthRequest: 40,
		heightRequest: 40,
		label: text,
	});
}

/**
 * @param {BlockProps} params
 * @param {import('types/variable').Variable<boolean>} collapsed
 * @param {import('types/variable').Variable<"first" | "last" | "single" | "none" | undefined>} position
 */
function getIconCss(params, collapsed, position) {
	const iconBorderRadius = Utils.derive(
		[collapsed, position],
		(collapsed, position) => {
			if (collapsed) {
				switch (position) {
					case "first":
						return "5px 0 0 5px";
					case "last":
						return "0 5px 5px 0";
					case "single":
						return "5px";
					default:
						return "0";
				}
			}
			return "5px 0 0 5px";
		},
	);
	const baseIconCss = propToVariable(params.iconCss ?? "");
	const iconCss = Utils.derive(
		[baseIconCss, iconBorderRadius],
		(baseIconCss, iconBorderRadius) =>
			`border-radius: ${iconBorderRadius}; ${baseIconCss}`,
	);
	return iconCss;
}

/**
 * @param {BlockProps} params
 * @param {import('types/variable').Variable<boolean>} collapsed
 * @param {import('types/variable').Variable<"first" | "last" | "single" | "none" | undefined>} position
 */
function getBlockCss(params, collapsed, position) {
	const borderRadius = Utils.derive(
		[collapsed, position],
		(collapsed, position) => {
			if (collapsed) {
				switch (position) {
					case "first":
						return "5px 0 0 5px";
					case "last":
						return "0 5px 5px 0";
					case "single":
						return "5px";
					default:
						return "0";
				}
			}
			return "5px";
		},
	);

	const baseCss = propToVariable(params.css ?? "");

	const css = Utils.derive(
		[borderRadius, baseCss],
		(borderRadius, baseCss) =>
			`border-radius: ${borderRadius}; background: ${colors.base00}; ${baseCss}`,
	);
	return css;
}

/**
 * @param {BlockProps} params
 */
function Block(params) {
	const collapsed = propToVariable(
		params.collapsed ?? params.text === undefined,
	);
	const position = propToVariable(params.position);

	const css = getBlockCss(params, collapsed, position);
	const iconCss = getIconCss(params, collapsed, position);
	const block = Widget.EventBox({
		// visible: params.visible ?? true,
		hexpand: params.hexpand ?? false,
		marginEnd: params.marginRight ?? 0,
		css: css.bind(),
		cursor:
			params.onClick !== undefined || params.onRelease !== undefined
				? "pointer"
				: "default",
		child: Widget.Box({
			children: [
				params.iconPath
					? IconImage(params.iconPath, iconCss.bind())
					: params.icon
						? IconText(params.icon, iconCss.bind())
						: Widget.Box({}),
				Widget.Revealer({
					transitionDuration: 500,
					transition: "slide_right",
					css: "border-radius: 10px;",
					// revealChild: params.collapsed !== true && params.text !== undefined,
					revealChild: transProp(
						params.collapsed,
						(collapsed) => collapsed !== true && params.text !== undefined,
					),
					child: Widget.Label({
						css: transProp(
							params.textCss,
							(textCss) => `border-radius: 10px; ${textCss ?? ""}`,
						),
						marginLeft: 10,
						marginRight: 10,
						label: params.text,
					}),
				}),
			],
		}),
	});

	if (params.visible !== undefined) {
		setTimeout(() => {
			if (typeof params.visible === "boolean") {
				block.set_visible(params.visible);
			} else {
				if (typeof params.visible !== "object") return;
				block.set_visible(
					params.visible.transformFn(
						params.visible.emitter[params.visible.prop],
					),
				);
				params.visible?.emitter.connect(
					`notify::${params.visible.prop}`,
					() => {
						if (typeof params.visible !== "object") return;
						block.set_visible(
							params.visible.transformFn(
								params.visible.emitter[params.visible.prop],
							),
						);
					},
				);
			}
		}, 100);
	}

	if (params.onClick !== undefined) {
		block.on_primary_click = params.onClick;
	}

	if (params.onRightClick !== undefined) {
		block.on_secondary_click = params.onRightClick;
	}

	if (params.onRelease !== undefined) {
		block.on_primary_click_release = params.onRelease;
	}
	if (params.tooltipMarkup !== undefined) {
		const tooltipMarkup = propToVariable(params.tooltipMarkup);
		block.set_tooltip_markup(tooltipMarkup.getValue());
		tooltipMarkup.connect("changed", ({ value: tooltipMarkup }) => {
			block.set_tooltip_markup(tooltipMarkup);
		});
	}

	if (params.onScroll !== undefined) {
		block.connect("scroll-event", params.onScroll);
	}

	return block;
}

export { Block };
