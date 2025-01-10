import { bind } from "astal/binding";
import { NotificationsService } from "../../services/notifications";
import { colors } from "../../utils/colors";
import { Block, Position } from "../../widgets/Block";

const notifications = new NotificationsService();

function Notifications(): JSX.Element {
	return (
		<Block
			marginRight={bind(notifications, "count").as((c) => (c > 0 ? 20 : 0))}
			position={bind(notifications, "count").as((c) =>
				c > 0 ? Position.SINGLE : Position.FIRST,
			)}
			icon={bind(notifications, "dnd").as((dnd) => (dnd ? "" : ""))}
			iconCss={bind(notifications, "count").as((c) =>
				c > 0 ? `background: ${colors.base08}; color: ${colors.base00};` : "",
			)}
			label={bind(notifications, "count").as((c) => c.toString())}
			labelCss="min-width: 30px;"
			collapsed={bind(notifications, "count").as((c) => c === 0)}
			onRelease={() => notifications.togglePanel()}
			onRightClick={() => {
				notifications.dnd = !notifications.dnd;
			}}
		/>
	);
}
export { Notifications };
