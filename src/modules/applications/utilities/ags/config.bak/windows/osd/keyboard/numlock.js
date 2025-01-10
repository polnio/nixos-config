import { keyboard } from "../../../services/keyboard.js";
import { OsdTextWindow, showWindow } from "../common.js";

const numlockWindow = OsdTextWindow({
	name: "numlock",
	icon: keyboard.bind("num_lock").as((v) => `num-lock-${v ? "on" : "off"}`),
	text: keyboard
		.bind("num_lock")
		.as((v) => (v ? "Num Lock On" : "Num Lock Off")),
});

keyboard.connect("notify::num-lock", () => {
	showWindow(numlockWindow);
});

export { numlockWindow };
