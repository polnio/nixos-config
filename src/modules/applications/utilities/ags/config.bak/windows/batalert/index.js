import { colors } from "../../utils/colors.js";

const battery = await Service.import("battery");

const batalertWindow = Widget.Window({
	css: `border: 2px solid ${colors.base08}; border-radius: 10px;`,
	name: "batalert",
	child: Widget.Box({
		margin: 30,
		hexpand: true,
		vexpand: true,
		children: [
			Widget.Icon({
				icon: "dialog-information",
				size: 64,
			}),
			Widget.Label({
				label: "Batalert",
				css: "font-size: 3em;",
			}),
		],
	}),
});

function updateWindow() {
	if (!battery.charging && battery.percent <= 10 && !batalertWindow.visible) {
		batalertWindow.visible = true;
	}
	if (batalertWindow.visible && (battery.percent > 10 || battery.charging)) {
		batalertWindow.visible = false;
	}
}

updateWindow();

battery.connect("notify::percent", updateWindow);
battery.connect("notify::charging", updateWindow);

export { batalertWindow };
