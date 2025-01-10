import { bind } from "astal/binding";
import { Variable } from "astal/variable";
import { Gtk } from "astal/gtk3";
import { HoverGroup } from "../../widgets/HoverGroup";
import { Block, Position } from "../../widgets/Block";
import { NotificationsService } from "../../services/notifications";
import { toggleWindow } from "../../utils/windows";

const notifications = new NotificationsService();

function Quit(): JSX.Element {
	const isHovered = Variable(false);
	return (
		<HoverGroup isHovered={isHovered} spacing={0}>
			<revealer
				transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
				transitionDuration={500}
				revealChild={isHovered()}
			>
				<box>
					<Block
						position={bind(notifications, "count").as((c) =>
							c > 0 ? Position.FIRST : Position.NONE,
						)}
						iconPath="bar-logout"
						onClick={() => toggleWindow("confirm-logout")}
					/>
					<Block
						iconPath="bar-suspend"
						onClick={() => toggleWindow("confirm-suspend")}
					/>
					<Block
						iconPath="bar-reboot"
						onClick={() => toggleWindow("confirm-reboot")}
					/>
				</box>
			</revealer>
			<Block
				position={Variable.derive(
					[isHovered, bind(notifications, "count")],
					(h, nc) => (!h && nc > 0 ? Position.FIRST : Position.NONE),
				)()}
				iconPath="bar-shutdown"
				onClick={() => toggleWindow("confirm-shutdown")}
			/>
		</HoverGroup>
	);
}

export { Quit };
