import { Variable } from "astal/variable";
import { Block, Position } from "../../widgets/Block";
import { colors } from "../../utils/colors";

const TIME_ICONS = [
	"󱑊",
	"󱐿",
	"󱑀",
	"󱑁",
	"󱑂",
	"󱑃",
	"󱑄",
	"󱑅",
	"󱑆",
	"󱑇",
	"󱑈",
	"󱑉",
] as const;

type TimeData = {
	icon: (typeof TIME_ICONS)[number];
	timeWithoutSecs: string;
	timeWithSecs: string;
};

const mightShowSecs = Variable(false);

const timeData = Variable<TimeData>({
	icon: TIME_ICONS[0],
	timeWithoutSecs: "00:00",
	timeWithSecs: "00:00:00",
}).poll(1000, () => {
	const date = new Date();
	return {
		icon: TIME_ICONS[date.getHours() % TIME_ICONS.length],
		timeWithoutSecs: date.toLocaleTimeString("fr-FR", {
			hour: "2-digit",
			minute: "2-digit",
		}),
		timeWithSecs: date.toLocaleTimeString("fr-FR", {
			hour: "2-digit",
			minute: "2-digit",
			second: "2-digit",
		}),
	};
});

function Time(): JSX.Element {
	return (
		<Block
			position={Position.SINGLE}
			icon={timeData((data) => data.icon)}
			label={Variable.derive(
				[timeData, mightShowSecs],
				(data, mightShowSecs) =>
					mightShowSecs ? data.timeWithSecs : data.timeWithoutSecs,
			)()}
			iconCss={`background: ${colors.base0D}; color: ${colors.base00}`}
			onClick={() => mightShowSecs.set(!mightShowSecs.get())}
		/>
	);
}

export { Time };
