import { colors } from "../../utils/colors.js";
import { applicationsWidget } from "./applications.js";
import { dateWidget } from "./date.js";
import { keyboardWidget } from "./keyboard.js";
import { mediaWidget } from "./media.js";
import { notificationsWidget } from "./notifications.js";
import { outputsWidget } from "./outputs.js";
import { quitWidget } from "./quit.js";
import { resourcesWidget } from "./resources.js";
import { systrayWidget } from "./systray.js";
import { titleWidget } from "./title.js";
import { updatesWidget } from "./updates.js";
import { networkWidget } from "./network.js";
import { workspacesWidget } from "./workspaces.js";

const barWindow = Widget.Window({
	css: `background: transparent; color: ${colors.base05};`,
	name: "bar",
	anchor: ["top", "left", "right"],
	// exclusivity: "exclusive",
	child: Widget.CenterBox({
		css: "padding: 10px;",
		vertical: false,
		// startWidget: workspacesWidget,
		startWidget: Widget.Box({
			spacing: 20,
			children: [
				workspacesWidget /* applicationsWidget, titleWidget */,
				// mediaWidget,
			],
		}),
		centerWidget: dateWidget,
		endWidget: Widget.Box({
			hpack: "end",
			children: [
				outputsWidget,
				keyboardWidget,
				networkWidget,
				resourcesWidget,
				updatesWidget,
				notificationsWidget,
				quitWidget,
				systrayWidget,
			],
		}),
	}),
});

export { barWindow };
