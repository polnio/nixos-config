import { colors } from "../../utils/colors.js";
import { Block } from "../../widgets/block.js";
import { HoverGroup } from "../../widgets/blockGroup.js";

const battery = await Service.import("battery");
const BATTERY_ICONS = /** @type {const} */ ([" ", " ", " ", " ", " "]);
function getBatteryIconFromPercent() {
	return BATTERY_ICONS[
		Math.floor((battery.percent * BATTERY_ICONS.length) / 101)
	];
}

const diskUsage = Variable("0%", {
	poll: [3_600_000, "df -k /", (out) => out.split("\n")[1].split(/ +/)[4]],
});

const ramUsage = Variable("0%", {
	poll: [
		2000,
		"free -m",
		(out) => {
			const columns = out.split("\n")[1].split(/ +/);
			return `${Math.floor(
				(parseInt(columns[2]) / parseInt(columns[1])) * 100,
			)}%`;
		},
	],
});

/* const cpuUsage = Variable("0%", {
	listen: [`${App.configDir}/scripts/cpuusage`],
}); */

const temp = Variable("0°C", {
	poll: [
		2000,
		"acpi -t",
		(out) => {
			const lines = out.split("\n");
			const sum = lines.reduce(
				(acc, line) => acc + parseInt(line.split(": ")[1].split(" ")[1]),
				0,
			);
			const temp = Math.round(sum / lines.length);
			return `${temp}°C`;
		},
	],
});

const secs = Variable(0, {
	poll: [1000, () => Math.floor(Date.now() / 1000)],
});

if (!battery.charging || battery.charged) {
	secs.stopPoll();
}

const batteryIcon = Variable(getBatteryIconFromPercent());

battery.connect("notify::charging", () => {
	if (battery.charging && !battery.charged && !secs.is_polling) {
		secs.startPoll();
	}
	if (!battery.charging && secs.is_polling) {
		secs.stopPoll();
	}
});

battery.connect("notify::charged", () => {
	if (battery.charged && secs.is_polling) {
		secs.stopPoll();
		batteryIcon.value = BATTERY_ICONS[BATTERY_ICONS.length - 1];
	}
});

battery.connect("notify::percent", () => {
	if (battery.charging) {
		return;
	}
	batteryIcon.value = getBatteryIconFromPercent();
});

secs.connect("changed", ({ value: secs }) => {
	if (!battery.charging) {
		return;
	}
	const minIndex = Math.floor((battery.percent * BATTERY_ICONS.length) / 100);
	batteryIcon.value =
		BATTERY_ICONS[minIndex + (secs % (BATTERY_ICONS.length - minIndex))];
});

const resourcesWidget = HoverGroup({
	children: (isHovered) => [
		Block({
			position: "first",
			// icon: "",
			iconPath: "drive-multidisk-symbolic",
			text: diskUsage.bind(),
			collapsed: isHovered.bind().as((isHovered) => !isHovered),
			iconCss: `background: ${colors.base0A}; color: ${colors.base00};`,
		}),
		Block({
			// icon: "󰍛",
			iconPath: "ram-symbolic",
			text: ramUsage.bind(),
			collapsed: isHovered.bind().as((isHovered) => !isHovered),
			iconCss: `background: ${colors.base0A}; color: ${colors.base00}`,
		}),
		Block({
			// icon: "",
			iconPath: "cpu-symbolic",
			// text: cpuUsage.bind(),
			text: "0",
			collapsed: isHovered.bind().as((isHovered) => !isHovered),
			iconCss: `background: ${colors.base0A}; color: ${colors.base00}`,
		}),
		Block({
			// icon: "",
			iconPath: "temp-symbolic",
			text: temp.bind(),
			collapsed: isHovered.bind().as((isHovered) => !isHovered),
			iconCss: `background: ${colors.base0A}; color: ${colors.base00};`,
		}),
		Block({
			position: "last",
			marginRight: 20,
			// icon: batteryIcon.bind(),
			iconPath: battery.bind("icon_name"),
			text: battery.bind("percent").as((percent) => `${Math.round(percent)}%`),
			collapsed: isHovered.bind().as((isHovered) => !isHovered),
			iconCss: `background: ${colors.base0A}; color: ${colors.base00};`,
		}),
	],
});

export { resourcesWidget };
