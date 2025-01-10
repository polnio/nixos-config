import Wp from "gi://AstalWp";
import { Variable } from "astal/variable";
import { HoverGroup } from "../../widgets/HoverGroup";
import { Block, Position } from "../../widgets/Block";
import { brightnessService } from "../../services/brightness";
import { bind } from "astal/binding";
import { colors } from "../../utils/colors";

const audio = Wp.get_default()?.audio;
if (audio === undefined) {
	throw new Error("No audio");
}

const BRIGHTNESS_ICONS = ["󰃚", "󰃛", "󰃜", "󰃝", "󰃞", "󰃟", "󰃠"] as const;

function Outputs(): JSX.Element {
	if (audio === undefined) {
		return <></>;
	}
	const isHovered = Variable(false);
	return (
		<HoverGroup isHovered={isHovered}>
			<Block
				collapsed={isHovered((v) => !v)}
				position={Position.FIRST}
				icon={bind(brightnessService, "brightness").as(
					(v) =>
						BRIGHTNESS_ICONS[
							Math.min(
								Math.floor(v * BRIGHTNESS_ICONS.length),
								BRIGHTNESS_ICONS.length - 1,
							)
						]!,
				)}
				label={bind(brightnessService, "brightness").as(
					(v) => `${Math.round(v * 100)}%`,
				)}
				iconCss={`background: ${colors.base09}; color: ${colors.base00};`}
			/>
			<Block
				collapsed={isHovered((v) => !v)}
				position={Position.LAST}
				marginRight={20}
				iconPath={bind(audio.defaultSpeaker, "volumeIcon")}
				label={bind(audio.defaultSpeaker, "volume").as(
					(v) => `${Math.round(v * 100)}%`,
				)}
				iconCss={`background: ${colors.base09}; color: ${colors.base00};`}
				onClick={() => {
					audio.defaultSpeaker.mute = !audio.defaultSpeaker.mute;
				}}
			/>
		</HoverGroup>
	);
}

export { Outputs };
