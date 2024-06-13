import { colors } from "../../utils/colors.js";
import { Block } from "../../widgets/block.js";

/* const updates = Variable(0, {
	poll: [
		3_600_000,
		"/home/polnio/.local/bin/unipac --no-interactive update --count",
		(out) => parseInt(out.trim()),
	],
}); */

// const mightUpdate = Utils.exec("might-update") === "1";
const mightUpdate = false;

/* const updatesWidget = Widget.Stack({
	marginEnd: updates.bind().as((updates) => (updates > 0 ? 20 : 0)),
	shown: updates.bind().as((updates) => (updates > 0 ? "visible" : "hidden")),
	children: {
		visible: Widget.Revealer({
			transition: "slide_left",
			revealChild: updates.bind().as((updates) => updates > 0),
			child: Block({
				icon: "",
				iconCss: `background: ${colors.base08}; color: ${colors.base00};`,
				text: updates.bind().as((updates) => updates.toString()),
				textCss: "min-width: 30px;",
				visible: updates.bind().as((updates) => updates > 0),
			}),
		}),
		hidden: Widget.Box({}),
	},
}); */

const updatesWidget = Widget.Stack({
	marginEnd: mightUpdate ? 20 : 0,
	shown: mightUpdate ? "visible" : "hidden",
	children: {
		visible: Block({
			position: "single",
			icon: "",
			iconCss: `background: ${colors.base08}; color: ${colors.base00};`,
			visible: mightUpdate,
		}),
		hidden: Widget.Box({}),
	},
});

export { updatesWidget };
