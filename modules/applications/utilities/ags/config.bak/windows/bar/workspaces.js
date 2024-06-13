import { HoverGroup } from "../../widgets/blockGroup.js";
import { colors } from "../../utils/colors.js";

const hyprland = await Service.import("hyprland");

const workspacesWidget = Widget.Box({
	css: `background: ${colors.base00}; border-radius: 5px; padding: 0 3px;`,
	hpack: "start",
	child: HoverGroup({
		spacing: 0,
		children: (isHovered) =>
			Array.from({ length: 9 }, (_, i) =>
				Widget.Revealer({
					transition: "slide_left",
					transitionDuration: 500,
					child: Widget.EventBox({
						vpack: "center",
						widthRequest: 35,
						heightRequest: 25,
						cursor: "pointer",
						onPrimaryClick: () => {
							hyprland.messageAsync(`dispatch workspace ${i + 1}`);
						},
						child: Widget.Label({
							widthRequest: 25,
							heightRequest: 25,
							hpack: "center",
							label: (i + 1).toString(),
							css: hyprland.active.workspace.bind("id").as((currentId) => {
								let style = "border-radius: 5px;";
								if (currentId === i + 1) {
									style += `background: ${colors.base0D}; color: ${colors.base00}`;
								}
								return style;
							}),
						}),
					}),
					setup: (revealer) => {
						revealer.reveal_child =
							isHovered.getValue() ||
							hyprland.getWorkspace(i + 1) !== undefined;
						isHovered.connect("changed", () => {
							revealer.reveal_child =
								isHovered.getValue() ||
								hyprland.getWorkspace(i + 1) !== undefined;
						});
						hyprland.connect("notify::workspaces", () => {
							revealer.reveal_child =
								isHovered.getValue() ||
								hyprland.getWorkspace(i + 1) !== undefined;
						});
					},
				}),
			),
	}),
});

export { workspacesWidget };
