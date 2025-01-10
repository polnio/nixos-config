import { colors } from "../../utils/colors.js";

const Gtk = imports.gi.Gtk;

const applications = await Service.import("applications");

const value = Variable("");

const apps = Variable(applications.query(""));
applications.connect("changed", () => {
	apps.value = applications.query("");
});

/** @type {import('types/widgets/entry.js').Entry | undefined} */
let entry;

const appWidgets = Utils.derive([apps], (apps) =>
	apps.map((app) =>
		Widget.Button({
			visible: value.bind().as((value) => app.match(value)),
			onClicked: () => {
				applauncherWindow.visible = false;
				value.value = "";
				app.launch();
			},
			child: Widget.Box({
				children: [
					Widget.Icon({
						icon: app.icon_name ?? "",
						size: 42,
					}),
					Widget.Label({
						label: app.name,
						hexpand: true,
						vpack: "center",
						truncate: "end",
					}),
				],
			}),
		}),
	),
);

const applauncherWindow = Widget.Window({
	css: `border: 2px solid ${colors.base0D}; border-radius: 10px;`,
	name: "applauncher",
	keymode: "exclusive",
	widthRequest: 576,
	heightRequest: 810,
	visible: false,
	setup: (self) => {
		self.keybind("Escape", () => {
			self.visible = false;
		});
		self.keybind(["CONTROL"], "n", () => {
			self.vfunc_move_focus(Gtk.DirectionType.TAB_FORWARD);
		});
		self.keybind(["CONTROL"], "p", () => {
			self.vfunc_move_focus(Gtk.DirectionType.TAB_BACKWARD);
		});
	},
	child: Widget.Box({
		margin: 30,
		vertical: true,
		children: [
			Widget.Entry({
				placeholderText: "Rechercher",
				text: value.bind(),
				marginBottom: 10,
				onAccept: () => {
					appWidgets.value.find((widget) => widget.visible)?.clicked();
				},
				onChange: ({ text }) => {
					value.value = text ?? "";
				},
				setup: (self) => {
					entry = self;
				},
			}),
			Widget.Scrollable({
				hscroll: "never",
				vscroll: "always",
				vexpand: true,
				child: Widget.Box({
					vertical: true,
					spacing: 10,
					children: appWidgets.bind(),
				}),
			}),
		],
	}),
});

applauncherWindow.connect("notify::visible", () => {
	if (applauncherWindow.visible) {
		entry?.grab_focus();
	}
});

export { applauncherWindow };
