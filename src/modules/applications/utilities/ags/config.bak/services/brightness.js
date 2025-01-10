const maxValue = parseInt(
	Utils.exec('bash -c "cat /sys/class/backlight/*/max_brightness"'),
);

function getBrightness() {
	const value = parseInt(
		Utils.exec('bash -c "cat /sys/class/backlight/*/brightness"'),
	);
	return (value / maxValue) * 100;
}

const brightness = Variable(getBrightness());

Utils.monitorFile("/sys/class/backlight/intel_backlight/brightness", () => {
	brightness.setValue(getBrightness());
});

export { brightness };
