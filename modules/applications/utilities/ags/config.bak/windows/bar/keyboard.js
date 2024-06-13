import { colors } from "../../utils/colors.js";
import { Block } from "../../widgets/block.js";
import { HoverGroup } from "../../widgets/blockGroup.js";

globalThis.isCapsLock = Variable(false);
globalThis.isNumLock = Variable(false);

const keyboardWidget = HoverGroup({
	children: (isHovered) => [
		Widget.Revealer({
			transition: "slide_right",
			transitionDuration: 300,
			revealChild: globalThis.isCapsLock.bind(),
			child: Block({
				position: globalThis.isNumLock
					.bind()
					.as((isNumLock) => (isNumLock ? "first" : "single")),
				marginRight: globalThis.isNumLock
					.bind()
					.as((isNumLock) => (!isNumLock ? 20 : 0)),
				iconCss: `background: ${colors.base08}; color: ${colors.base00}; font-size: 1.5em;`,
				icon: "󰬈",
				text: "Caps Lock",
				collapsed: isHovered.bind().as((isHovered) => !isHovered),
			}),
		}),
		Widget.Revealer({
			transition: "slide_right",
			transitionDuration: 300,
			revealChild: globalThis.isNumLock.bind(),
			child: Block({
				position: globalThis.isCapsLock
					.bind()
					.as((isCapsLock) => (isCapsLock ? "last" : "single")),
				marginRight: 20,
				iconCss: `background: ${colors.base08}; color: ${colors.base00}; font-size: 1.5em;`,
				icon: "󰎤",
				text: "Num Lock",
				collapsed: isHovered.bind().as((isHovered) => !isHovered),
			}),
		}),
	],
});

export { keyboardWidget };
