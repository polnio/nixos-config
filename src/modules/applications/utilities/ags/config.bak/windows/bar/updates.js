import { colors } from "../../utils/colors.js";
import { Block } from "../../widgets/block.js";

const updates = Utils.execAsync([
	"bash",
	"-c",
	"nw os update -ql | wc -l",
]).then((result) => parseInt(result.trim()));

const updatesWidget = Widget.Box({
	setup(self) {
		updates.then((updates) => {
			if (updates > 0) {
				self.child = Block({
					position: "single",
					icon: "",
					iconCss: `background: ${colors.base08}; color: ${colors.base00};`,
					text: updates.toString(),
					textCss: "min-width: 30px;",
					marginRight: 20,
				});
			}
		});
	},
});

export { updatesWidget };
