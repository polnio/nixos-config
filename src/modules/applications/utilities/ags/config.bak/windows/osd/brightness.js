import { getIcon, ProgressOsdWindow, showWindow } from "./common.js";
import { brightness } from "../../services/brightness.js";

const brightnessOsdWindow = ProgressOsdWindow({
	name: "brightness",
	icon: brightness.bind().as((v) => `brightness-${getIcon(v)}-symbolic`),
	value: brightness.bind().as((v) => v / 100),
});

brightness.connect("changed", () => {
	showWindow(brightnessOsdWindow);
});

export { brightnessOsdWindow };
