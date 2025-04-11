import { App, Astal } from "astal/gtk3";
import Battery from "gi://AstalBattery";
import { colors } from "../../utils/colors";

const battery = Battery.get_default();

function BatAlert() {
	return (
		<window
			css={`border: 2px solid ${colors.base08}; border-radius: 10px;`}
			name="batalert"
			application={App}
			layer={Astal.Layer.OVERLAY}
			setup={(window) => {
				function updateWindow() {
					if (
						!battery.get_charging() &&
						battery.get_percentage() <= 0.1 &&
						!window.visible
					) {
						window.visible = true;
					}
					if (
						window.visible &&
						(battery.get_percentage() > 0.1 || battery.get_charging())
					) {
						window.visible = false;
					}
				}
				updateWindow();
				battery.connect("notify::percentage", updateWindow);
				battery.connect("notify::charging", updateWindow);
			}}
		>
			<box margin={30} hexpand vexpand>
				<icon icon="dialog-information" css="font-size: 64px;" />
				<label label="Batalert" css="font-size: 3em;" />
			</box>
		</window>
	);
}

export { BatAlert };
