import { Gtk, type Widget, Astal } from "astal/gtk3";
import { bind, type Subscribable } from "astal/binding";
import type Binding from "astal/binding";
import { Variable } from "astal/variable";
import type GdkPixbuf from "gi://GdkPixbuf";
import { propToSubscribable, transProp, type Prop } from "../utils/props";
import { colors } from "../utils/colors";

enum Position {
	SINGLE,
	FIRST,
	LAST,
	NONE,
}

type EventHandler<Event> = (widget: Widget.EventBox, event: Event) => void;

interface BlockProps {
	icon?: Prop<string | undefined>;
	iconPath?: Prop<string | undefined>;
	iconRaw?: Prop<GdkPixbuf.Pixbuf | undefined>;
	label?: Prop<string | undefined>;
	collapsed?: Prop<boolean | undefined>;
	visible?: Prop<boolean | undefined>;
	css?: Prop<string | undefined>;
	iconCss?: Prop<string | undefined>;
	labelCss?: Prop<string | undefined>;
	position?: Prop<Position | undefined>;
	marginRight?: Prop<number | undefined>;
	hexpand?: Prop<boolean | undefined>;
	onClick?: EventHandler<Astal.ClickEvent> | undefined;
	onRightClick?: EventHandler<Astal.ClickEvent> | undefined;
	onRelease?: EventHandler<Astal.ClickEvent> | undefined;
	// onScroll?: Prop<EventHandler | undefined>;
	onDestroy?: (widget: Widget.EventBox) => void;
}

function getBlockCss(
	baseCss: Subscribable<string>,
	collapsed: Subscribable<boolean>,
	position: Subscribable<Position>,
): Variable<string> {
	return Variable.derive(
		[baseCss, collapsed, position],
		(baseCss, collapsed, position) => {
			let borderRadius: string;
			if (collapsed) {
				switch (position) {
					case Position.SINGLE:
						borderRadius = "5px";
						break;
					case Position.FIRST:
						borderRadius = "5px 0 0 5px";
						break;
					case Position.LAST:
						borderRadius = "0 5px 5px 0";
						break;
					case Position.NONE:
						borderRadius = "0";
						break;
				}
			} else {
				borderRadius = "5px";
			}

			return `border-radius: ${borderRadius}; background-color: ${colors.base00}; ${baseCss}`;
		},
	);
}

function getIconCss(
	baseCss: Subscribable<string>,
	collapsed: Subscribable<boolean>,
	position: Subscribable<Position>,
): Variable<string> {
	return Variable.derive(
		[baseCss, collapsed, position],
		(baseCss, collapsed, position) => {
			let borderRadius: string;
			if (collapsed) {
				switch (position) {
					case Position.SINGLE:
						borderRadius = "5px";
						break;
					case Position.FIRST:
						borderRadius = "5px 0 0 5px";
						break;
					case Position.LAST:
						borderRadius = "0 5px 5px 0";
						break;
					case Position.NONE:
						borderRadius = "0";
						break;
				}
			} else {
				borderRadius = "5px 0 0 5px";
			}

			return `border-radius: ${borderRadius}; ${baseCss}`;
		},
	);
}

function IconImage(icon: Prop<string>, css: Prop<string>): JSX.Element {
	const vcss = Variable.derive(
		[propToSubscribable(css)],
		(e) => `font-size: 20px; ${e}`,
	);
	return <icon css={vcss()} icon={icon} widthRequest={40} heightRequest={40} />;
}

function IconRaw(icon: Prop<GdkPixbuf.Pixbuf>, css: Prop<string>): JSX.Element {
	const vcss = Variable.derive(
		[propToSubscribable(css)],
		(e) => `font-size: 20px; ${e}`,
	);
	return (
		<icon css={vcss()} pixbuf={icon} widthRequest={40} heightRequest={40} />
	);
}

function IconText(icon: Prop<string>, css: Prop<string>): JSX.Element {
	const vcss = Variable.derive(
		[propToSubscribable(css)],
		(e) => `font-size: 20px; ${e}`,
	);
	return (
		<label css={vcss()} label={icon} widthRequest={40} heightRequest={40} />
	);
}

function Icon(
	props: BlockProps,
	iconCss: Prop<string>,
): Binding<JSX.Element | null> {
	return Variable.derive(
		[
			propToSubscribable(props.icon),
			propToSubscribable(props.iconPath),
			propToSubscribable(props.iconRaw),
		],
		(icon, iconPath, iconRaw) => {
			if (icon !== undefined) return IconText(icon, iconCss);
			if (iconPath !== undefined) return IconImage(iconPath, iconCss);
			if (iconRaw !== undefined) return IconRaw(iconRaw, iconCss);
			return null;
		},
	)();
}

function Block(props: BlockProps): JSX.Element {
	const baseCss = bind(propToSubscribable(props.css)).as((css) => css ?? "");
	const baseIconCss = bind(propToSubscribable(props.iconCss)).as(
		(css) => css ?? "",
	);
	const collapsed = bind(propToSubscribable(props.collapsed)).as(
		(collapsed) => collapsed ?? props.label === undefined,
	);
	const position = bind(propToSubscribable(props.position)).as(
		(position) => position ?? Position.NONE,
	);
	const css = getBlockCss(baseCss, collapsed, position);
	const iconCss = getIconCss(baseIconCss, collapsed, position);
	return (
		<eventbox
			visible={props.visible ?? true}
			hexpand={props.hexpand ?? false}
			marginEnd={props.marginRight ?? 0}
			css={css()}
			onClick={(w, e) => {
				if (
					props.onRightClick === undefined ||
					e.button === Astal.MouseButton.PRIMARY
				) {
					props.onClick?.(w, e);
				} else if (
					props.onRightClick !== undefined &&
					e.button === Astal.MouseButton.SECONDARY
				) {
					props.onRightClick?.(w, e);
				}
			}}
			onClickRelease={(w, e) => {
				if (
					props.onRightClick === undefined ||
					e.button === Astal.MouseButton.PRIMARY
				) {
					props.onRelease?.(w, e);
				}
			}}
			onDestroy={props.onDestroy}
		>
			<box>
				{Icon(props, iconCss())}
				<revealer
					transitionType={Gtk.RevealerTransitionType.SLIDE_RIGHT}
					transitionDuration={500}
					css="border-radius: 10px;"
					revealChild={transProp(
						props.collapsed,
						(collapsed) => !collapsed && props.label !== undefined,
					)}
				>
					<label
						css={transProp(
							props.labelCss,
							(css) => `border-radius: 10px; ${css ?? ""}`,
						)}
						marginStart={10}
						marginEnd={10}
						label={props.label ?? ""}
					/>
				</revealer>
			</box>
		</eventbox>
	);
}

export { Block, Position };
