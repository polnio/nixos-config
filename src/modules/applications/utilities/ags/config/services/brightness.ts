import { GObject, property, register } from "astal/gobject";
import { execAsync } from "astal/process";
import { monitorFile, readFileAsync, writeFileAsync } from "astal/file";
import { Variable } from "astal/variable";

const device = (await execAsync("ls /sys/class/backlight")).trim();
const maxBrightness = Number.parseInt(
	(await readFileAsync(`/sys/class/backlight/${device}/max_brightness`)).trim(),
);
async function getBrightness() {
	const data = (
		await readFileAsync(`/sys/class/backlight/${device}/brightness`)
	).trim();
	return Number.parseInt(data) / maxBrightness;
}
const brightness = Variable(await getBrightness());
monitorFile(`/sys/class/backlight/${device}/brightness`, async () => {
	brightness.set(await getBrightness());
});

@register()
class BrightnessService extends GObject.Object {
	constructor() {
		super();
		brightness.subscribe(() => this.notify("brightness"));
	}

	@property(String)
	get device() {
		return device;
	}

	@property(Number)
	get brightness(): number {
		return brightness.get();
	}

	set brightness(value: number) {
		writeFileAsync(
			`/sys/class/backlight/${device}/brightness`,
			(value * maxBrightness).toString(),
		);
	}
}

const brightnessService = new BrightnessService();

export { BrightnessService, brightnessService };
