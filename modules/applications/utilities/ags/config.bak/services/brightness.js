// const device = Utils.exec("ls -w1 /sys/class/backlight | head -1");

const maxValue = parseInt(Utils.exec("brightnessctl max"));

function getBrightness() {
	const value = parseInt(Utils.exec("brightnessctl get"));
	return (value / maxValue) * 100;
}

const brightness = Variable(getBrightness());

Utils.monitorFile("/sys/class/backlight/intel_backlight/brightness", () => {
	brightness.setValue(getBrightness());
});

export { brightness };
