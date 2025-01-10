import { notifications } from "../../services/notifications.js";
import { Block } from "../../widgets/block.js";
import { HoverGroup } from "../../widgets/blockGroup.js";

const countVariable = Variable(notifications.count);
notifications.connect("notify::count", () => {
	countVariable.setValue(notifications.count);
});

const quitWidget = HoverGroup({
	spacing: 0,
	children: (isHovered) => [
		Widget.Revealer({
			transition: "slide_left",
			transitionDuration: 500,
			revealChild: isHovered.bind(),
			child: Widget.Box({
				children: [
					Block({
						position: notifications
							.bind("count")
							.as((count) => (count > 0 ? "first" : "none")),
						iconPath: `${App.configDir}/assets/logout.svg`,
						onClick: () => globalThis.confirmSubject.setValue("logout"),
					}),
					Block({
						iconPath: `${App.configDir}/assets/suspend.svg`,
						onClick: () => globalThis.confirmSubject.setValue("suspend"),
					}),
					Block({
						iconPath: `${App.configDir}/assets/reboot.svg`,
						onClick: () => globalThis.confirmSubject.setValue("reboot"),
					}),
				],
			}),
		}),
		Block({
			position: Utils.derive([isHovered, countVariable], (isHovered, count) =>
				!isHovered && count > 0 ? "first" : "none",
			).bind(),
			iconPath: `${App.configDir}/assets/shutdown.svg`,
			onClick: () => globalThis.confirmSubject.setValue("shutdown"),
		}),
	],
});

export { quitWidget };
