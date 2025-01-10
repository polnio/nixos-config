import { keyboard } from "../../../services/keyboard.js";
import { OsdTextWindow, showWindow } from "../common.js";

const capslockWindow = OsdTextWindow({
	name: "capslock",
	icon: keyboard.bind("caps_lock").as((v) => `caps-lock-${v ? "on" : "off"}`),
	text: keyboard
		.bind("caps_lock")
		.as((v) => (v ? "Caps Lock On" : "Caps Lock Off")),
});

keyboard.connect("notify::caps-lock", () => {
	showWindow(capslockWindow);
});

export { capslockWindow };
