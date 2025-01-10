import { AudioOsdWindow } from "./common.js";

const microphoneOsdWindow = AudioOsdWindow({
	device: "microphone",
	iconFormat: "microphone-sensitivity-%s-symbolic",
});

export { microphoneOsdWindow };
