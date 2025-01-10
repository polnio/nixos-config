import { Variable } from "astal/variable";
import { type Prop, propToSubscribable } from "../utils/props";

interface HoverGroupProps {
	isHovered: Variable<boolean>;
	visible?: Prop<boolean> | undefined;
	spacing?: Prop<number> | undefined;
	marginRight?: Prop<number> | undefined;
	child: Prop<JSX.Element> | undefined;
	children: Prop<JSX.Element[]> | undefined;
}

function HoverGroup(props: HoverGroupProps): JSX.Element {
	const spacing = Variable.derive(
		[props.isHovered, propToSubscribable(props.spacing)],
		(isHovered, spacing) => spacing ?? (isHovered ? 20 : 0),
	);
	return (
		<eventbox
			visible={props.visible ?? true}
			marginEnd={props.marginRight ?? 0}
			onHover={() => props.isHovered.set(true)}
			onHoverLost={() => props.isHovered.set(false)}
		>
			<box spacing={spacing()}>{props.child ?? props.children}</box>
		</eventbox>
	);
}

export { HoverGroup };
