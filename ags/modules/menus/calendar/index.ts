import { TimeWidget } from "./time/index.js";
import { CalendarWidget } from "./calendar.js";
import DropDownMenuCentered from "../DropDownMenuCentered.js";
import { MediaWidget } from "./media/index.js";
export default () => {
  return DropDownMenuCentered({
    name: "calendarmenu",
    transition: "crossfade",
    child: Widget.Box({
      class_name: "calendar-menu-content",
      css: "padding: 1px; margin: -1px;",
      vexpand: false,
      children: [
        Widget.Box({
          class_name: "calendar-content-container",
          vertical: true,
          children: [
            Widget.Box({
              class_name: "calendar-content-items",
              vertical: true,
              children: [TimeWidget(), CalendarWidget(), MediaWidget()],
            }),
          ],
        }),
      ],
    }),
  });
};
