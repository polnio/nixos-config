import type Binding from "astal/binding";
import type { Entry } from "astal/gtk3/widget";
import { colors } from "../../utils/colors";
import Apps from "gi://AstalApps";
import { bind } from "astal/binding";
import { App, Astal, Gtk, Gdk } from "astal/gtk3";
import { Variable } from "astal/variable";

const applications = new Apps.Apps();
const value = Variable("");

let window: Gtk.Widget;

const appsWidget: Binding<Gtk.Button[]> = bind(applications, "list").as(
	(apps) =>
		apps.map((app) => (
			<button
				visible={value((v) => applications.fuzzy_score(v, app) > 0)}
				onClicked={() => {
					window.visible = false;
					value.set("");
					app.launch();
				}}
			>
				<box>
					<icon icon={app.get_icon_name()} css="font-size: 3em;" />
					<label
						label={app.get_name()}
						hexpand
						valign={Gtk.Align.CENTER}
						truncate
					/>
				</box>
			</button>
		)),
);

let entry: Entry | undefined;

function AppLauncher() {
	window = (
		<window
			name="app-launcher"
			css={`background: ${colors.base00}; border: 2px solid ${colors.base0D}; border-radius: 10px;`}
			keymode={Astal.Keymode.EXCLUSIVE}
			className="AppLauncher"
			widthRequest={576}
			heightRequest={810}
			visible={false}
			application={App}
			onKeyPressEvent={(w, e) => {
				if (e.get_keyval()[1] === Gdk.KEY_Escape) {
					w.visible = false;
				}
			}}
			setup={(w) => {
				w.connect("notify::visible", () => {
					if (w.visible) {
						entry?.grab_focus();
					}
				});
			}}
		>
			<box margin={30} vertical>
				<entry
					placeholderText="Search..."
					marginBottom={10}
					text={value()}
					onChanged={(w) => {
						value.set(w.text);
					}}
					onActivate={() => {
						appsWidget
							.get()
							.find((w) => w.visible)
							?.clicked();
					}}
					setup={(self) => {
						entry = self;
					}}
				/>
				<scrollable
					hscroll={Gtk.PolicyType.NEVER}
					vscroll={Gtk.PolicyType.ALWAYS}
					vexpand
				>
					<box vertical spacing={10}>
						{appsWidget}
					</box>
				</scrollable>
			</box>
		</window>
	);
	return window;
}

export { AppLauncher };
