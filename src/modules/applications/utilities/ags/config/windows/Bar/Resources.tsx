import { bind } from "astal/binding";
import { Variable } from "astal/variable";
import { HoverGroup } from "../../widgets/HoverGroup";
import { Block, Position } from "../../widgets/Block";
import { colors } from "../../utils/colors";
import Battery from "gi://AstalBattery";

const battery = Battery.get_default();

const diskUsage = Variable("0%").poll(
	3_600_000,
	"df -k /",
	(out) => out.split("\n")[1]?.split(/ +/)[4] ?? "0%",
);

const ramUsage = Variable("0%").poll(2_000, "free -m", (out) => {
	const columns = out.split("\n")[1]?.split(/ +/);
	return `${Math.floor((parseInt(columns?.[2] ?? "0") / parseInt(columns?.[1] ?? "1")) * 100)}%`;
});

const cpuUsage = Variable("0%").poll(
	2_000,
	'bash -c "LANG=C top -bn1 | grep Cpu"',
	(out) => `${out.split(/ +/)[1]?.replace(",", ".") ?? "0"}%`,
);

const temp = Variable("0°C").poll(2_000, "acpi -t", (out) => {
	const lines = out.split("\n");
	const sum = lines.reduce(
		(acc, line) => acc + parseInt(line.split(": ")[1]?.split(" ")[1] ?? "0"),
		0,
	);
	const temp = Math.round(sum / lines.length);
	return `${temp}°C`;
});

function Resources(): JSX.Element {
	const isHovered = Variable(false);
	return (
		<HoverGroup isHovered={isHovered}>
			<Block
				position={Position.FIRST}
				iconPath="drive-multidisk-symbolic"
				label={diskUsage()}
				collapsed={isHovered((v) => !v)}
				iconCss={`background: ${colors.base0A}; color: ${colors.base00};`}
			/>
			<Block
				position={Position.NONE}
				iconPath="ram-symbolic"
				label={ramUsage()}
				collapsed={isHovered((v) => !v)}
				iconCss={`background: ${colors.base0A}; color: ${colors.base00};`}
			/>
			<Block
				position={Position.NONE}
				iconPath="cpu-symbolic"
				label={cpuUsage()}
				collapsed={isHovered((v) => !v)}
				iconCss={`background: ${colors.base0A}; color: ${colors.base00};`}
			/>
			<Block
				position={Position.NONE}
				iconPath="temp-symbolic"
				label={temp()}
				collapsed={isHovered((v) => !v)}
				iconCss={`background: ${colors.base0A}; color: ${colors.base00};`}
			/>
			<Block
				position={Position.LAST}
				marginRight={20}
				iconPath={bind(battery, "batteryIconName")}
				label={bind(battery, "percentage").as((v) => `${Math.round(v * 100)}%`)}
				collapsed={isHovered((v) => !v)}
				iconCss={`background: ${colors.base0A}; color: ${colors.base00};`}
			/>
		</HoverGroup>
	);
}

export { Resources };
