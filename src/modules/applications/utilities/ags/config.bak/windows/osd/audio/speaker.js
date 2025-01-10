import { AudioOsdWindow } from "./common.js";

const speakerOsdWindow = AudioOsdWindow({
	device: "speaker",
	iconFormat: "audio-volume-%s-symbolic",
});

export { speakerOsdWindow };
