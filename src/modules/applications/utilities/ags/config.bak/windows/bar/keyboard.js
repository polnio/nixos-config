import { colors } from "../../utils/colors.js";
import { Block } from "../../widgets/block.js";
import { HoverGroup } from "../../widgets/blockGroup.js";
import { keyboard } from "../../services/keyboard.js";
import { propToVariable } from "../../utils/props.js";

const isEmpty = Variable(true);
let timeout;
keyboard.connect("changed", () => {
	if (keyboard.state === "") {
		timeout = setTimeout(() => {
			isEmpty.value = true;
			timeout = undefined;
		}, 300);
	} else {
		if (timeout) clearTimeout(timeout);
		isEmpty.value = false;
	}
});

const state = propToVariable(keyboard.bind("state"));

const keyboardWidget = HoverGroup({
	marginRight: isEmpty.bind().as((empty) => (empty ? 0 : 20)),
	spacing: 0,
	children: (isHovered) => [
		Widget.Revealer({
			transition: "slide_right",
			transitionDuration: 300,
			revealChild: keyboard.bind("layout").as((layout) => layout !== "us"),
			child: Block({
				position: keyboard
					.bind("state")
					.as((state) => (state === "j" ? "single" : "first")),
				iconCss: `background: ${colors.base08}; color: ${colors.base00}; font-size: 1.5em;`,
				icon: "JP",
				text: "Japanese",
				marginRight: Utils.derive([isHovered, state], (isHovered, state) =>
					isHovered && state !== "j" ? 20 : 0,
				).bind(),
				collapsed: isHovered.bind().as((isHovered) => !isHovered),
			}),
		}),
		Widget.Revealer({
			transition: "slide_right",
			transitionDuration: 300,
			revealChild: keyboard.bind("caps_lock"),
			child: Block({
				position: keyboard.bind("state").as((state) => {
					if (state.includes("j") && state.includes("n")) return "none";
					if (state.includes("j")) return "last";
					if (state.includes("n")) return "first";
					return "single";
				}),
				iconCss: `background: ${colors.base08}; color: ${colors.base00}; font-size: 1.5em;`,
				icon: "󰬈",
				text: "Caps Lock",
				marginRight: Utils.derive([isHovered, state], (isHovered, state) =>
					isHovered && state.includes("n") ? 20 : 0,
				).bind(),
				collapsed: isHovered.bind().as((isHovered) => !isHovered),
			}),
		}),
		Widget.Revealer({
			transition: "slide_right",
			transitionDuration: 300,
			revealChild: keyboard.bind("num_lock"),
			child: Block({
				position: keyboard
					.bind("state")
					.as((state) => (state === "n" ? "single" : "last")),
				iconCss: `background: ${colors.base08}; color: ${colors.base00}; font-size: 1.5em;`,
				icon: "󰎤",
				text: "Num Lock",
				marginRight: 0,
				collapsed: isHovered.bind().as((isHovered) => !isHovered),
			}),
		}),
	],
});

export { keyboardWidget };
