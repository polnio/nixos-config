// import {  } from "astal"
import { confirmWindow } from "./windows/confirm/index.js";
import { barWindow } from "./windows/bar/index.js";
import { applauncherWindow } from "./windows/applauncher/index.js";
import { batalertWindow } from "./windows/batalert/index.js";
import { osdWindows } from "./windows/osd/index.js";
// import { dashboardWindow } from "./windows/dashboard/index.js";

App.config({
	windows: [
		barWindow,
		confirmWindow,
		applauncherWindow,
		batalertWindow,
		// dashboardWindow,
		...osdWindows,
	],
});
