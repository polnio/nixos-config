import { colors } from "../../utils/colors.js";
import { Block } from "../../widgets/block.js";

const DATE_ICONS = /** @type {const} */ ([
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
]);

const mightShowSecs = Variable(false);

const dateStr = Variable(
	/** @type {{ icon: typeof DATE_ICONS[number], dateWithoutSecs: string, dateWithSecs: string }} */ ({
		icon: DATE_ICONS[0],
		dateWithoutSecs: "00:00",
		dateWithSecs: "00:00:00",
	}),
	{
		poll: [
			1000,
			() => {
				const date = new Date();
				return {
					icon: DATE_ICONS[date.getHours() % 12],
					dateWithoutSecs: date.toLocaleTimeString("fr-FR", {
						hour: "2-digit",
						minute: "2-digit",
					}),
					dateWithSecs: date.toLocaleTimeString("fr-FR", {
						hour: "2-digit",
						minute: "2-digit",
						second: "2-digit",
					}),
				};
			},
		],
	},
);

const dateWidget = Block({
	icon: dateStr.bind().as((date) => date.icon),
	text: Utils.derive([dateStr, mightShowSecs], (date, mightShowSecs) =>
		mightShowSecs ? date.dateWithSecs : date.dateWithoutSecs,
	).bind(),
	iconCss: `background: ${colors.base0D}; color: ${colors.base00}`,
	onClick: () => {
		mightShowSecs.value = !mightShowSecs.value;
	},
});

export { dateWidget };
