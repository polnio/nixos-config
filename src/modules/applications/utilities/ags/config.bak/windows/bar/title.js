import { Block } from "../../widgets/block.js";

const hyprland = await Service.import("hyprland");

const titleWidget = Block({
	position: "single",
	text: hyprland.active.client.bind("title"),
	visible: hyprland.active.client.bind("title").as((title) => title.length > 0),
});

export { titleWidget };
