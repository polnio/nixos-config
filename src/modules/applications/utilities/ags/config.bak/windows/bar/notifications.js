import { colors } from "../../utils/colors.js";
import { notifications } from "../../services/notifications.js";
import { Block } from "../../widgets/block.js";

const notificationsWidget = Block({
	marginRight: notifications.bind("count").as((count) => (count > 0 ? 20 : 0)),
	position: notifications
		.bind("count")
		.as((count) => (count > 0 ? "single" : "first")),
	icon: notifications.bind("dnd").as((dnd) => (dnd ? "" : "")),
	iconCss: notifications
		.bind("count")
		.as((count) =>
			count > 0 ? `background: ${colors.base08}; color: ${colors.base00}` : "",
		),
	text: notifications.bind("count").as((count) => count.toString()),
	textCss: "min-width: 30px;",
	collapsed: notifications.bind("count").as((count) => count === 0),
	onRelease: () => {
		notifications.togglePanel();
	},
	onRightClick: () => {
		notifications.dnd = !notifications.dnd;
	},
});

export { notificationsWidget };
