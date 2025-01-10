import { HoverGroup } from "../../widgets/blockGroup.js";
import { Block } from "../../widgets/block.js";
import { colors } from "../../utils/colors.js";

// const wifi = await Service.import("network");
// const bluetooth = await Service.import("bluetooth");

const [wifi, bluetooth] = await Promise.all([
	Service.import("network"),
	Service.import("bluetooth"),
]);

const WIFI_ICONS = /** @type {const} */ (["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"]);
const AUTH_WIFI_ICONS = /** @type {const} */ (["󰤬", "󰤡", "󰤤", "󰤧", "󰤪"]);
const CONNECTING_WIFI_ICONS = /** @type {const} */ (["󰤫", "󰤠", "󰤣", "󰤦", "󰤩"]);

/**
 * @param {readonly string[]} icons
 * @param {number} percentage
 */
function getIconFromPercentage(icons, percentage) {
	return icons[Math.floor((percentage * icons.length) / 101)];
}

wifi.connect("notify::connectivity", () => {
	// console.log(network.connectivity);
});

function getIcon() {
	// console.log(network);
	if (wifi.connectivity === "none" || wifi.wifi.internet === "disconnected") {
		return " ";
	}

	if (wifi.wifi.internet === "connecting") {
		return getIconFromPercentage(CONNECTING_WIFI_ICONS, wifi.wifi.strength);
	}
	if (wifi.wifi.state === "need_auth" || wifi.connectivity === "portal") {
		return getIconFromPercentage(AUTH_WIFI_ICONS, wifi.wifi.strength);
	}
	return getIconFromPercentage(WIFI_ICONS, wifi.wifi.strength);
}

const wifiIcon = Variable(getIcon());
wifi.connect("notify::connectivity", () => {
	wifiIcon.value = getIcon();
});
wifi.connect("notify::wifi", () => {
	wifiIcon.value = getIcon();
});

const bluetoothDevice = Variable(getBluetoothDevice());

function getBluetoothDevice() {
	return bluetooth.enabled ? bluetooth.connected_devices[0] : undefined;
}

function updateBluetoothDevice() {
	bluetoothDevice.value = getBluetoothDevice();
}
bluetooth.connect("device-added", updateBluetoothDevice);
bluetooth.connect("device-removed", updateBluetoothDevice);
bluetooth.connect("notify::enabled", updateBluetoothDevice);

const networkWidget = HoverGroup({
	children: (isHovered) => [
		Block({
			position: bluetoothDevice
				.bind()
				.as((device) => (device !== undefined ? "first" : "single")),
			/* icon: network.wifi
				.bind("strength")
				.as(
					(strength) =>
						WIFI_ICONS[Math.floor((strength * WIFI_ICONS.length) / 101)],
				), */
			icon: wifiIcon.bind(),
			iconCss: `background: ${colors.base0E}; color: ${colors.base00};`,
			text: wifi.wifi.bind("ssid").as((ssid) => ssid ?? ""),
			collapsed: isHovered.bind().as((isHovered) => !isHovered),
			visible: wifiIcon.bind().as((icon) => icon !== " "),
		}),
		Block({
			position: wifiIcon
				.bind()
				.as((icon) => (icon !== " " ? "last" : "single")),
			icon: "󰂯",
			iconCss: `background: ${colors.base0E}; color: ${colors.base00};`,
			text: bluetoothDevice.bind().as((device) => device?.alias ?? ""),
			collapsed: isHovered.bind().as((isHovered) => !isHovered),
			visible: bluetoothDevice.bind().as((device) => device !== undefined),
		}),
	],
	marginRight: Utils.derive(
		[wifiIcon, bluetoothDevice],
		(wifiIcon, bluetoothDevice) =>
			wifiIcon !== " " || bluetoothDevice !== undefined ? 20 : 0,
	).bind(),
});

export { networkWidget };
