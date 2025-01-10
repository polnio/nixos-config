import { colors } from "../../utils/colors.js";

/**
 * @typedef {"shutdown" | "reboot" | "suspend" | "logout"} Subject
 */

globalThis.confirmSubject = Variable(
	/** @type {Subject | undefined} */ (undefined),
);

function show() {
	confirmWindow.visible = true;
	confirmWindow.keymode = "exclusive";
}

function hide() {
	confirmWindow.visible = false;
	confirmWindow.keymode = "none";
}

/**
 * @typedef {Object} ConfirmProps
 * @property {Subject} subject
 * @property {string} title
 * @property {string} icon
 * @property {string} command
 */

/**
 * @param {ConfirmProps} params
 */
function ConfirmWidget(params) {
	return Widget.Box({
		vertical: true,
		vexpand: true,
		children: [
			Widget.Box({
				hpack: "center",
				hexpand: true,
				vexpand: true,
				children: [
					Widget.Icon({
						icon: params.icon,
						size: 64,
					}),
					Widget.Label({
						label: params.title,
						css: "font-size: 3em;",
					}),
				],
			}),
			Widget.Box({
				children: [
					Widget.Button({
						label: "No",
						hexpand: true,
						margin: 10,
						onClicked: () => {
							confirmWindow.visible = false;
						},
						setup: (button) => {
							globalThis.confirmSubject.connect(
								"changed",
								({ value: confirmSubject }) => {
									if (confirmSubject === params.subject) {
										button.grab_focus();
									}
								},
							);
						},
					}),
					Widget.Button({
						label: "Yes",
						hexpand: true,
						margin: 10,
						onClicked: () => {
							confirmWindow.visible = false;
							setTimeout(() => {
								Utils.exec(params.command);
							}, 100);
						},
					}),
				],
			}),
		],
	});
}

const confirmShutdown = ConfirmWidget({
	subject: "shutdown",
	title: "Power off?",
	icon: "system-shutdown-symbolic",
	command: "systemctl poweroff",
});

const confirmReboot = ConfirmWidget({
	subject: "reboot",
	title: "Reboot?",
	icon: "system-reboot-symbolic",
	command: "systemctl reboot",
});

const confirmSuspend = ConfirmWidget({
	subject: "suspend",
	title: "Suspend?",
	icon: "system-suspend-symbolic",
	command: "systemctl suspend",
});

const confirmLogout = ConfirmWidget({
	subject: "logout",
	title: "Logout?",
	icon: "system-log-out-symbolic",
	// command: "hyprctl dispatch exit",
	command: "hyprlock",
});

const confirmWindow = Widget.Window({
	css: `border: 2px solid ${colors.base0D}; border-radius: 10px;`,
	name: "confirm",
	widthRequest: 576,
	heightRequest: 216,
	visible: false,
	child: globalThis.confirmSubject.bind().as((subject) => {
		switch (subject) {
			case "shutdown":
				return confirmShutdown;
			case "reboot":
				return confirmReboot;
			case "suspend":
				return confirmSuspend;
			case "logout":
				return confirmLogout;
			default:
				return Widget.Box({});
		}
	}),
});

confirmWindow.keybind("Escape", hide);

globalThis.confirmSubject.connect("changed", (subject) =>
	subject ? show() : hide(),
);

export { confirmWindow };
