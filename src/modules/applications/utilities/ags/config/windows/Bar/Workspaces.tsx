import { Gtk } from "astal/gtk3";
import { Variable } from "astal/variable";
import { HoverGroup } from "../../widgets/HoverGroup";
import Hyprland from "gi://AstalHyprland";
import { colors } from "../../utils/colors";
import { bind } from "astal/binding";

const hyprland = Hyprland.get_default();

function Workspaces() {
	const isHovered = Variable(false);
	return (
		<box
			halign={Gtk.Align.START}
			css={`background: ${colors.base00}; border-radius: 5px; padding: 0 3px;`}
		>
			<HoverGroup isHovered={isHovered} spacing={0}>
				{Array.from({ length: 9 }, (_, i) => {
					const workspace = i + 1;
					const mightReveal = Variable.derive(
						[isHovered, bind(hyprland, "workspaces")],
						(isHovered, _) =>
							isHovered || hyprland.get_workspace(workspace) !== null,
					);
					const isCurrent = bind(hyprland, "focusedWorkspace").as(
						(w) => w.id === workspace,
					);
					return (
						<revealer
							revealChild={mightReveal()}
							transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
							transitionDuration={500}
						>
							<eventbox
								valign={Gtk.Align.CENTER}
								widthRequest={35}
								heightRequest={25}
								cursor="pointer"
								onClick={() =>
									hyprland.dispatch("workspace", workspace.toString())
								}
							>
								<label
									widthRequest={25}
									heightRequest={25}
									halign={Gtk.Align.CENTER}
									label={workspace.toString()}
									css={isCurrent.as((v) => {
										let style = "border-radius: 5px;";
										if (v) {
											style += `background: ${colors.base0D}; color: ${colors.base00}`;
										}
										return style;
									})}
								/>
							</eventbox>
						</revealer>
					);
				})}
			</HoverGroup>
		</box>
	);
}

export { Workspaces };
