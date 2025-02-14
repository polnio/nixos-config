type Colors = {
	base00: string;
	base01: string;
	base02: string;
	base03: string;
	base04: string;
	base05: string;
	base06: string;
	base07: string;
	base08: string;
	base09: string;
	base0A: string;
	base0B: string;
	base0C: string;
	base0D: string;
	base0E: string;
	base0F: string;
};

import { readFile } from "astal/file";

const path = "/home/polnio/.local/share/colors.json";
const colors: Colors = JSON.parse(readFile(path));

export { colors };
