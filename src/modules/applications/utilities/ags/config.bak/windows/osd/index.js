import { speakerOsdWindow } from "./audio/speaker.js";
import { microphoneOsdWindow } from "./audio/microphone.js";
import { brightnessOsdWindow } from "./brightness.js";
import { capslockWindow } from "./keyboard/capslock.js";
import { numlockWindow } from "./keyboard/numlock.js";

const osdWindows = [
	speakerOsdWindow,
	microphoneOsdWindow,
	brightnessOsdWindow,
	capslockWindow,
	numlockWindow,
];

export { osdWindows };
