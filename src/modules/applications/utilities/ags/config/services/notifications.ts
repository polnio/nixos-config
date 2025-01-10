import { GObject, property, register } from "astal/gobject";
import Variable from "astal/variable";
import { execAsync } from "astal/process";

const listener = Variable({ text: "0", alt: "none" }).watch(
	"swaync-client -swb",
	(out) => JSON.parse(out),
);

@register()
class NotificationsService extends GObject.Object {
	#count = 0;
	#dnd = false;

	constructor() {
		super();
		listener.subscribe(({ text, alt }) => {
			const count = Number.parseInt(text);
			const dnd = alt.includes("dnd-");
			if (count !== this.#count) {
				this.#count = count;
				this.notify("count");
			}
			if (dnd !== this.#dnd) {
				this.#dnd = dnd;
				this.notify("dnd");
			}
		});
	}

	@property(Number)
	get count() {
		return this.#count;
	}

	@property(Boolean)
	get dnd() {
		return this.#dnd;
	}
	set dnd(value: boolean) {
		if (this.#dnd === value) {
			return;
		}
		execAsync(`swaync-client -d${value ? "n" : "f"}`);
		this.#dnd = value;
		this.notify("dnd");
	}

	togglePanel() {
		execAsync("swaync-client -t");
	}
}

export { NotificationsService };
