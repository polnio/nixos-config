class NotificationsService extends Service {
	/** @type {Set<NotificationsService>} */
	static #instances = new Set();

	static {
		Service.register(
			NotificationsService,
			{},
			{ count: ["int", "r"], dnd: ["boolean", "rw"] },
		);

		/** @type {import('types/variable').Variable<{ text: string, alt: string }>} */
		const listener = Variable(
			{ text: "0", alt: "none" },
			{
				listen: ["swaync-client -swb", (out) => JSON.parse(out)],
			},
		);

		listener.connect("changed", ({ value: { text, alt } }) => {
			const count = parseInt(text);
			const dnd = alt.includes("dnd-");
			if (NotificationsService.#count !== count) {
				NotificationsService.#count = count;
				NotificationsService.#notifyAll("count");
			}
			if (NotificationsService.#dnd !== dnd) {
				NotificationsService.#dnd = dnd;
				NotificationsService.#notifyAll("dnd");
			}
		});
	}

	static #count = 0;
	get count() {
		return NotificationsService.#count;
	}

	static #dnd = false;
	get dnd() {
		return NotificationsService.#dnd;
	}
	set dnd(value) {
		if (NotificationsService.#dnd === value) {
			return;
		}
		Utils.execAsync(`swaync-client -d${value ? "n" : "f"}`);
		NotificationsService.#dnd = value;
		NotificationsService.#notifyAll("dnd");
	}

	/**
	 * @param {string} prop
	 */
	static #notifyAll(prop) {
		for (const instance of NotificationsService.#instances) {
			instance.notify(prop);
		}
	}

	constructor() {
		super();
		NotificationsService.#instances.add(this);
	}

	togglePanel() {
		Utils.exec("swaync-client -t");
	}
}

const notifications = new NotificationsService();

export { notifications, NotificationsService };
