import { App } from "astal/gtk3";

function toggleWindow(name: string) {
	const window = App.get_windows().find((w) => w.name === name);
	if (window) {
		window.visible = !window.visible;
	}
}

export { toggleWindow };
