import { App } from "astal/gtk3";
// import style from "./style.scss"
import { Bar } from "./windows/Bar";
import { Confirm } from "./windows/Confirm";
import { AppLauncher } from "./windows/AppLauncher";
import { BatAlert } from "./windows/BatAlert";

App.start({
	// css: style,
	icons: `${SRC}/assets`,
	main() {
		App.get_monitors().map(Bar);
		AppLauncher();
		BatAlert();
		Confirm({
			subject: "shutdown",
			title: "Power off?",
			icon: "system-shutdown-symbolic",
			command: "systemctl poweroff",
		});
		Confirm({
			subject: "reboot",
			title: "Reboot?",
			icon: "system-reboot-symbolic",
			command: "systemctl reboot",
		});
		Confirm({
			subject: "suspend",
			title: "Suspend?",
			icon: "system-suspend-symbolic",
			command: "systemctl suspend",
		});
		Confirm({
			subject: "logout",
			title: "Logout?",
			icon: "system-log-out-symbolic",
			// command: "hyprctl dispatch exit",
			command: "hyprlock",
		});
	},
});
