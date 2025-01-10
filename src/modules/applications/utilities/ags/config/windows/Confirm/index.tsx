import { App, Gtk } from "astal/gtk3";
import { colors } from "../../utils/colors";
import { execAsync } from "astal/process";

interface ConfirmProps {
	subject: string;
	title: string;
	icon: string;
	command: string;
}

function Confirm(props: ConfirmProps) {
	const window = (
		<window
			name={`confirm-${props.subject}`}
			css={`background: ${colors.base00}; border: 2px solid ${colors.base0D}; border-radius: 10px;`}
			className="Confirm"
			widthRequest={576}
			heightRequest={216}
			visible={false}
			application={App}
		>
			<box vertical vexpand>
				<box halign={Gtk.Align.CENTER} hexpand vexpand>
					<icon icon={props.icon} css="font-size: 5em;" />
					<label label={props.title} css="font-size: 3em;" />
				</box>
				<box>
					<button
						label="No"
						hexpand
						margin={10}
						onClicked={() => {
							window.visible = false;
						}}
					/>
					<button
						label="Yes"
						hexpand
						margin={10}
						onClicked={() => {
							window.visible = false;
							setTimeout(() => {
								execAsync(props.command);
							}, 100);
						}}
					/>
				</box>
			</box>
		</window>
	);
	return window;
}

export { Confirm };
