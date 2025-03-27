import { bind } from "astal/binding";
import { NotificationsService } from "../../services/notifications";
import { colors } from "../../utils/colors";
import { Block, Position } from "../../widgets/Block";
import { execAsync } from "astal/process";

const updatesPromise = execAsync([
	"bash",
	"-c",
	"nw os update -ql | wc -l",
]).then((result) => parseInt(result.trim()));

function Updates(): JSX.Element {
	return (
		<box
			setup={(self) => {
				updatesPromise.then((updates) => {
					if (updates > 0) {
						self.child = (
							<Block
								marginRight={20}
								position={Position.SINGLE}
								icon=""
								iconCss={`background: ${colors.base08}; color: ${colors.base00};`}
								label={updates.toString()}
								labelCss="min-width: 30px;"
							/>
						);
					}
				});
			}}
		/>
	);
}
export { Updates };
