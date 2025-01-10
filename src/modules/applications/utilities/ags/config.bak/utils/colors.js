// const colors = /** @type {const} */ ({
// 	red: "#f7768e",
// 	orange: "#ff9e64",
// 	yellow: "#e0af68",
// 	green: "#9ece6a",
// 	blue: "#7aa2f7",
// 	cyan: "#7dcfff",
// 	purple: "#bb9af7",
// 	aqua: "#7dcfff",
// 	gray: "#565f89",
// 	white: "#c0caf5",
// 	light: "#cfc9c2",
// 	black: "#1a1b26",
// });

// const colors = /** @type {const} */ ({
// 	red: "#f38ba8",
// 	peach: "#fab387",
// 	yellow: "#f9e2af",
// 	green: "#a6e3a1",
// 	blue: "#89b4fa",
// 	sapphire: "#74c7ec",
// 	mauve: "#cba6f7",
// 	text: "#cdd6f4",
// 	base: "#1e1e2e",
// 	crust: "#11111b",
// });

/** @typedef {Object} Colors
 * @property {string} base00 background
 * @property {string} base01
 * @property {string} base02
 * @property {string} base03
 * @property {string} base04
 * @property {string} base05 white
 * @property {string} base06
 * @property {string} base07
 * @property {string} base08 red
 * @property {string} base09 orange
 * @property {string} base0A yellow
 * @property {string} base0B
 * @property {string} base0C
 * @property {string} base0D blue
 * @property {string} base0E purple
 * @property {string} base0F
 */

const path = `/home/${Utils.USER}/.local/share/colors.json`;
/** @type {Colors} */
const colors = JSON.parse(Utils.readFile(path));

export { colors };
