import { userWidget } from "./user.js";

const dashboardWindow = Widget.Window({
	// iconPath: `${App.configDir}/assets/logout.svg`,
	// css: 'background-image: url("file:///etc/nixos/modules/config/theme/wallpaper.png"); background-size: cover;',
	name: "dashboard",
	anchor: ["top", "bottom", "left", "right"],
	visible: false,
	// exclusivity: "exclusive",
	child: Widget.Box({
		// children: [userWidget],
	}),
});

setTimeout(() => {
	dashboardWindow.set_visible(true);
}, 500);

export { dashboardWindow };
