import Gio from "gi://Gio";
import GLib from "gi://GLib?version=2.0";

class KeyboardService extends Service {
	/** @type {Set<KeyboardService>} */
	static #instances = new Set();

	static {
		Service.register(
			KeyboardService,
			{},
			{
				layout: ["string", "rw"],
				"caps-lock": ["boolean", "r"],
				"num-lock": ["boolean", "r"],
				state: ["string", "r"],
			},
		);

		Gio.DBus.session.call(
			"org.fcitx.Fcitx5",
			"/controller",
			"org.fcitx.Fcitx.Controller1",
			"CurrentInputMethod",
			null,
			GLib.VariantType.new("(s)"),
			Gio.DBusCallFlags.NONE,
			-1,
			null,
			(_, result) => {
				const [layout] = Gio.DBus.session
					.call_finish(result)
					.get_child_value(0)
					.get_string();
				KeyboardService.#layout = layout === "mozc" ? "jp" : "us";
				KeyboardService.#notifyAll("layout");
			},
		);
	}

	/** @type {"us" | "jp"} */
	static #layout = "us";
	get layout() {
		return KeyboardService.#layout;
	}
	set layout(value) {
		Gio.DBus.session.call(
			"org.fcitx.Fcitx5",
			"/controller",
			"org.fcitx.Fcitx.Controller1",
			"SetCurrentIM",
			new GLib.Variant("(s)", [value === "jp" ? "mozc" : "keyboard-us"]),
			null,
			Gio.DBusCallFlags.NONE,
			-1,
			null,
			() => {
				KeyboardService.#layout = value;
				KeyboardService.#notifyAll("layout");
			},
		);
	}
	switchLayout() {
		this.layout = this.layout === "jp" ? "us" : "jp";
	}

	static #capsLock = false;
	get caps_lock() {
		return KeyboardService.#capsLock;
	}
	toogleCapsLock() {
		KeyboardService.#capsLock = !KeyboardService.#capsLock;
		KeyboardService.#notifyAll("caps-lock");
	}

	static #numLock = false;
	get num_lock() {
		return KeyboardService.#numLock;
	}
	toogleNumLock() {
		KeyboardService.#numLock = !KeyboardService.#numLock;
		KeyboardService.#notifyAll("num-lock");
	}

	get state() {
		let state = "";
		if (KeyboardService.#layout === "jp") state += "j";
		if (KeyboardService.#capsLock) state += "c";
		if (KeyboardService.#numLock) state += "n";
		return state;
	}

	constructor() {
		super();
		KeyboardService.#instances.add(this);
	}

	/**
	 * @param {string} prop
	 */
	static #notifyAll(prop) {
		for (const instance of KeyboardService.#instances) {
			instance.changed(prop);
			instance.notify("state");
		}
	}
}

const keyboard = new KeyboardService();
globalThis.keyboard = keyboard;

export { keyboard, KeyboardService };
