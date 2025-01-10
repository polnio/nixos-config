import {
	formatIcon,
	getIcon,
	ICONS,
	ProgressOsdWindow,
	showWindow,
} from "../common.js";

/**
 * @template T
 * @typedef {T | import("types/service").Binding<any, any, T>} Prop
 */

/**
 * @param {import("types/service/audio.js").Stream} device
 */
function getAudioIcon(device) {
	if (device.is_muted) {
		return "muted";
	}
	return getIcon(device.volume * 100);
}

const audioService = await Service.import("audio");

/** @typedef AudioOsdWindowParams
 * @property {string} iconFormat
 * @property {"speaker" | "microphone"} device
 */

/**
 * @param {AudioOsdWindowParams} params
 */
function AudioOsdWindow(params) {
	const device = audioService[params.device];

	const icon = Variable(formatIcon(params.iconFormat, getAudioIcon(device)));
	const isMutedVariable = Variable(false);
	function onChanged() {
		icon.value = formatIcon(params.iconFormat, getAudioIcon(device));
		showWindow(window);
	}
	setTimeout(() => {
		device.connect("notify::volume", onChanged);
		device.connect("notify::is-muted", () => {
			isMutedVariable.value = device.is_muted ?? false;
			onChanged();
		});
	}, 500);

	const window = ProgressOsdWindow({
		name: params.device,
		icon: icon.bind(),
		value: device.bind("volume"),
		progressBarCss: device
			.bind("is_muted")
			.as((isMuted) => `opacity: ${isMuted ? 0.5 : 1};`),
	});
	return window;
}

export { ICONS, getAudioIcon, AudioOsdWindow };
