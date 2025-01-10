import { applauncherWindow } from "../applauncher/index.js";
import { Block } from "../../widgets/block.js";
import { HoverGroup } from "../../widgets/blockGroup.js";

const systemtray = await Service.import("systemtray");

const systrayWidget = HoverGroup({
	spacing: 0,
	children: (isHover) => [
		Widget.Revealer({
			transition: "slide_left",
			transitionDuration: 500,
			revealChild: isHover.bind(),
			child: Widget.Box({
				children: systemtray.bind("items").as((items) =>
					items.map((item) =>
						Block({
							position: items.length === 0 ? "single" : undefined,
							iconPath: item.bind("icon"),
							tooltipMarkup: item.bind("tooltip_markup"),
							onClick: (_, event) => {
								item.activate(event);
							},
							onRightClick: (_, event) => item.openMenu(event),
						}),
					),
				),
			}),
		}),
		Block({
			position: "last",
			iconPath:
				// "/usr/share/icons/Suru++-Asprómauros/apps/22/xfce4-systray.svg",
				`${App.configDir}/assets/systray.svg`,
			onClick: () => {
				applauncherWindow.visible = !applauncherWindow.visible;
			},
		}),
	],
});

export { systrayWidget };
