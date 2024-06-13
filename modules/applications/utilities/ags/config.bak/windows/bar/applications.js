import { colors } from "../../utils/colors.js";
import { Block } from "../../widgets/block.js";

const hyprland = await Service.import("hyprland");

const applicationsWidget = Widget.Box({
	children: hyprland.bind("clients").as((clients) => {
		return clients
			.filter((client) => client.pid !== -1)
			.map((client, i, clients) => {
				console.log(clients.length);
				return Block({
					iconCss: hyprland.active.client
						.bind("address")
						.as((address) =>
							address === client.address
								? `border-bottom: 3px solid ${colors.base0D};`
								: "",
						),
					position:
						clients.length === 1
							? "single"
							: i === 0
								? "first"
								: i === clients.length - 1
									? "last"
									: undefined,
					iconPath: client.class,
					// text: client.title,
					tooltipMarkup: client.title,
					onClick: () => {
						console.log(client.pid);
						hyprland.messageAsync(`dispatch focuswindow pid:${client.pid}`);
					},
				});
			});
	}),
});
export { applicationsWidget };
