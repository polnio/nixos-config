/**
 * @template T
 * @typedef {T | import("types/service").Binding<any, any, T>} Prop
 */

/**
 * @typedef {import('types/@girs/gtk-3.0/gtk-3.0').default.Widget} Widget
 */

import { propToVariable } from "../../utils/props.js";
import { colors } from "../../utils/colors.js";

const ICONS = /** @type {const} */ ([
	[101, "overamplified"],
	[67, "high"],
	[34, "medium"],
	[1, "low"],
	[0, "muted"],
]);
const ICON_SIZE = 48;

/** @param {number} value */
function getIcon(value) {
	for (const [threshold, icon] of ICONS) {
		if (value >= threshold) {
			return icon;
		}
	}
	return "muted";
}

/** @typedef OsdWindowParams
 * @property {string} name
 * @property {Prop<Widget[]>} children
 */

/**
 * @param {OsdWindowParams} params
 */
function OsdWindow(params) {
	return Widget.Window({
		visible: false,
		name: `${params.name}Osd`,
		anchor: ["bottom"],
		margins: [32, 0],
		css: `border: 2px solid ${colors.base0D}; background: ${colors.base00}`,
		child: Widget.Box({
			margin: 30,
			spacing: 10,
			children: params.children,
		}),
	});
}

/** @typedef OsdTextWindowParams
 * @property {string} name
 * @property {Prop<string>} icon
 * @property {Prop<string>} [text]
 */

/**
 * @param {OsdTextWindowParams} params
 */
function OsdTextWindow(params) {
	return OsdWindow({
		name: params.name,
		children: [
			Widget.Icon({
				icon_name: params.icon,
				size: ICON_SIZE,
				css: `color: ${colors.base0D};`,
			}),
			Widget.Label({
				label: params.text,
				css: `color: ${colors.base0D}; font-size: 24px;`,
			}),
		],
	});
}

/** @typedef OsdProgressWindowParams
 * @property {string} name
 * @property {Prop<string>} icon
 * @property {Prop<number>} value
 * @property {Prop<string | undefined>} [progressBarCss]
 */

/**
 * @param {OsdProgressWindowParams} params
 */
function ProgressOsdWindow(params) {
	const progressBarCss = propToVariable(params.progressBarCss);
	return OsdWindow({
		name: params.name,
		children: [
			Widget.Icon({
				icon_name: params.icon,
				size: ICON_SIZE,
				css: `color: ${colors.base0D};`,
			}),
			Widget.ProgressBar({
				value: params.value,
				vpack: "center",
				css: progressBarCss.bind().as((v) => v ?? ""),
			}),
		],
	});
}

/** @type {import("gi://GLib").default.Source} */
let timeout;
/** @param {import("types/widgets/window.js").Window} window */
function showWindow(window) {
	window.visible = true;
	for (const w of App.windows) {
		if (w.name?.endsWith("Osd") && w.name !== window.name) {
			w.visible = false;
		}
	}
	if (timeout) {
		clearTimeout(timeout);
	}
	timeout = setTimeout(() => {
		window.visible = false;
	}, 1000);
}

/**
 * @param {string} format
 * @param {string} icon
 */
function formatIcon(format, icon) {
	return format.replace("%s", icon);
}

export {
	ProgressOsdWindow,
	OsdTextWindow,
	showWindow,
	ICONS,
	getIcon,
	formatIcon,
};
