import { App, Gdk, Gtk } from "astal/gtk3";
import { Variable } from "astal/variable";
import { HoverGroup } from "../../widgets/HoverGroup";
import Tray from "gi://AstalTray";
import { bind } from "astal/binding";
import { Block, Position } from "../../widgets/Block";
import { toggleWindow } from "../../utils/windows";

const tray = Tray.get_default();

/* tray.connect("notify::items", () => {
	console.log("------");
	for (const item of tray.get_items()) {
		console.log(
			item.get_tooltip()?.title,
			item.get_icon_name(),
			item.get_gicon(),
		);
	}
	console.log("------");
}); */

const isHovered = Variable(false);
/* const menus = new Set<Gtk.Menu>();
isHovered.subscribe(() => {
	for (const menu of menus) {
		menu.destroy();
	}
	menus.clear();
}); */

function Systray() {
	return (
		<HoverGroup isHovered={isHovered} spacing={0}>
			<revealer
				transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
				transitionDuration={500}
				revealChild={isHovered()}
			>
				<box>
					{bind(tray, "items").as((items) =>
						items
							.filter(
								(i) =>
									i.get_icon_name() !== null || i.get_icon_pixbuf() !== null,
							)
							.map((item) => {
								const menu = item.create_menu();
								return (
									<Block
										iconPath={bind(item, "iconName").as(
											(icon) => icon || undefined,
										)}
										iconRaw={bind(item, "iconPixbuf").as(
											(icon) => icon || undefined,
										)}
										onClick={(_, e) => item.activate(e.x, e.y)}
										onRightClick={(w) => {
											menu?.popup_at_widget(
												w,
												Gdk.Gravity.SOUTH,
												Gdk.Gravity.NORTH,
												null,
											);
										}}
										onDestroy={() => {
											menu?.destroy();
										}}
									/>
								);
							}),
					)}
				</box>
			</revealer>
			<Block
				position={Position.LAST}
				iconPath="bar-systray"
				onClick={() => toggleWindow("app-launcher")}
			/>
		</HoverGroup>
	);
}

export { Systray };
