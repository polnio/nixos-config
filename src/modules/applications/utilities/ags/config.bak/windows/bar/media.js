import { colors } from "../../utils/colors.js";
import { Block } from "../../widgets/block.js";

const mpris = await Service.import("mpris");

const current = Variable("");

/**
 * @param { import("types/service/mpris.js").MprisPlayer } player
 */
function MediaElement(player) {
	console.log(player.name, current.value);
	current.connect("changed", () => {
		console.log(player.name, current.value);
	});
	return Block({
		position: "single",
		hexpand: true,
		collapsed: false,
		text: player.bind("track_title"),
	});
}

/**
 * @param { import("types/service/mpris.js").MprisPlayer } player
 */
function MediaSelector(player) {
	return Widget.EventBox({
		onPrimaryClick: () => {
			current.value = player.name;
		},
		hexpand: true,
		heightRequest: 20,
		css: `background: ${colors.base0D}`,
	});
}

const mediaWidget = Widget.Box({
	vertical: true,
	children: [
		Widget.Box({
			homogeneous: true,
			spacing: 8,
			hexpand: true,
			children: mpris
				.bind("players")
				.as((players) => players.map(MediaSelector)),
		}),
		Widget.Stack({
			hexpand: true,
			children: mpris
				.bind("players")
				.as((players) =>
					Object.fromEntries(
						players.map((player) => [player.name, MediaElement(player)]),
					),
				),
			// visibleChildName: mpris.bind("players").as((players) => players[0]?.name),
			visibleChildName: current.bind(),
		}),
	],
});

export { mediaWidget };
