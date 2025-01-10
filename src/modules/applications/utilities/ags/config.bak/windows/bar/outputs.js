import { colors } from "../../utils/colors.js";
import { brightness } from "../../services/brightness.js";
import { Block } from "../../widgets/block.js";
import { HoverGroup } from "../../widgets/blockGroup.js";
import { propToVariable } from "../../utils/props.js";

const audio = await Service.import("audio");

const BRIGHTNESS_ICONS = /** @type {const} */ ([
	"󰃚",
	"󰃛",
	"󰃜",
	"󰃝",
	"󰃞",
	"󰃟",
	"󰃠",
]);

const VOLUME_ICONS = /** @type {const} */ (["󰕿", "󰖀", "󰕾"]);

const brightnessIcon = Utils.derive(
	[brightness],
	(brightness) =>
		BRIGHTNESS_ICONS[Math.floor((brightness / 101) * BRIGHTNESS_ICONS.length)],
);

const volume = propToVariable(audio.speaker.bind("volume"));
const is_muted = Variable(false);
audio.speaker.connect("notify::is-muted", () => {
	is_muted.setValue(audio.speaker.stream?.is_muted ?? false);
});
const volumeIcon = Utils.derive([volume, is_muted], (volume, is_muted) =>
	is_muted ? "󰝟" : VOLUME_ICONS[Math.floor(volume * VOLUME_ICONS.length)],
);

const outputsWidget = HoverGroup({
	children: (isHovered) => [
		Block({
			position: "first",
			icon: brightnessIcon.bind(),
			collapsed: isHovered.bind().as((isHovered) => !isHovered),
			iconCss: `background: ${colors.base09}; color: ${colors.base00};`,
			text: brightness.bind().as((brightness) => `${Math.floor(brightness)}%`),
		}),
		Block({
			onClick: () => {
				// audio.speaker.is_muted = !audio.speaker.is_muted;
				Utils.exec("pactl set-sink-mute @DEFAULT_SINK@ toggle");
			},
			marginRight: 20,
			position: "last",
			icon: volumeIcon.bind(),
			collapsed: isHovered.bind().as((isHovered) => !isHovered),
			iconCss: `background: ${colors.base09}; color: ${colors.base00};`,
			text: audio.speaker
				.bind("volume")
				.as((volume) => `${Math.floor(volume * 100)}%`),
		}),
	],
});

export { outputsWidget };
