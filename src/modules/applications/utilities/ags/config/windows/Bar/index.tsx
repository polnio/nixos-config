import { App, Astal, Gtk, type Gdk } from "astal/gtk3";
import { Workspaces } from "./Workspaces";
import { Time } from "./Time";
import { Outputs } from "./Outputs";
import { colors } from "../../utils/colors";
import { Network } from "./Network";
import { Resources } from "./Resources";
import { Notifications } from "./Notifications";
import { Quit } from "./Quit";
import { Systray } from "./Systray";

function Bar(gdkmonitor: Gdk.Monitor) {
	return (
		<window
			css={`background: transparent; color: ${colors.base05};`}
			className="Bar"
			anchor={
				Astal.WindowAnchor.TOP |
				Astal.WindowAnchor.LEFT |
				Astal.WindowAnchor.RIGHT
			}
			gdkmonitor={gdkmonitor}
			exclusivity={Astal.Exclusivity.EXCLUSIVE}
			application={App}
		>
			<centerbox css="padding: 10px;">
				<Workspaces />
				<Time />
				<box halign={Gtk.Align.END}>
					<Outputs />
					<Network />
					<Resources />
					<Notifications />
					<Quit />
					<Systray />
				</box>
			</centerbox>
		</window>
	);
}

export { Bar };
