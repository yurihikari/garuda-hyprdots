import DropdownMenu from "../../DropdownMenu.js";
import { Media } from "./media.js";

const MediaWidget = () => {
  return Widget.Box({
    class_name: "calendar-menu-item-container media",
    child: Widget.Box({
      class_name: "menu-items media",
      hpack: "fill",
      hexpand: true,
      child: Widget.Box({
        class_name: "menu-items-container media",
        hpack: "fill",
        hexpand: true,
        child: Media(),
      }),
    }),
  });
};

export { MediaWidget };
