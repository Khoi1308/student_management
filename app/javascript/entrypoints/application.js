import { Application } from "@hotwired/stimulus";
import { registerControllers } from "stimulus-vite-helpers";

const application = Application.start();
const controllers = import.meta.glob("../controllers/*_controller.js", {
  eager: true,
});
registerControllers(application, controllers);

import "chartkick/chart.js";
import "flowbite/dist/flowbite.min.js";
