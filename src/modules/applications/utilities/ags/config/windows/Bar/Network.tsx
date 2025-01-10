import { Variable } from "astal/variable";
import { HoverGroup } from "../../widgets/HoverGroup";
import { Block, Position } from "../../widgets/Block";
import Network from "gi://AstalNetwork";
import Bluetooth from "gi://AstalBluetooth";
import { bind } from "astal/binding";
import { colors } from "../../utils/colors";

const network = Network.get_default();
const bluetooth = Bluetooth.get_default();

const bluetoothDevice = Variable<Bluetooth.Device | undefined>(undefined);
const bluetoothDeviceListeners = new Map<Bluetooth.Device, number>();
function updateBluetoothDevice() {
	bluetoothDevice.set(bluetooth.get_devices().find((d) => d.get_connected()));
}
function bluetoothDeviceListen(device: Bluetooth.Device) {
	if (bluetoothDeviceListeners.has(device)) {
		return;
	}
	bluetoothDeviceListeners.set(
		device,
		device.connect("notify::icon-name", () => {
			bluetoothDevice.set(device);
		}),
	);
	updateBluetoothDevice();
}
bluetooth.get_devices().forEach(bluetoothDeviceListen);
bluetooth.connect("device-added", bluetoothDeviceListen);
bluetooth.connect("device-removed", (_, device) => {
	bluetoothDeviceListeners.delete(device);
	updateBluetoothDevice();
});

function NetworkWidget() {
	const isHovered = Variable(false);
	const marginRight = Variable.derive(
		[bind(network.wifi, "activeConnection"), bluetoothDevice],
		(activeConnection, bluetoothDevice) =>
			activeConnection !== undefined || bluetoothDevice !== undefined ? 20 : 0,
	);
	return (
		<HoverGroup isHovered={isHovered} marginRight={marginRight()}>
			<Block
				position={bluetoothDevice((d) =>
					d !== undefined ? Position.FIRST : Position.SINGLE,
				)}
				iconPath={bind(network.wifi, "iconName")}
				iconCss={`background: ${colors.base0E}; color: ${colors.base00};`}
				label={bind(network.wifi, "ssid")}
				collapsed={isHovered((v) => !v)}
				visible={bind(network.wifi, "activeConnection").as(
					() => network.wifi.get_active_connection() !== null,
				)}
			/>
			<Block
				position={bind(network.wifi, "activeConnection").as(() =>
					network.wifi.get_active_connection() !== null
						? Position.LAST
						: Position.SINGLE,
				)}
				iconPath={bluetoothDevice((d) => d?.get_icon() ?? "")}
				label={bluetoothDevice((d) => d?.get_name() ?? "")}
				collapsed={isHovered((v) => !v)}
				visible={bluetoothDevice((d) => d !== undefined)}
			/>
		</HoverGroup>
	);
}

export { NetworkWidget as Network };
