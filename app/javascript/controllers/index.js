import { application } from "./application";

const controllerFiles = import.meta.glob("./**/*_controller.js", { eager: true });

Object.values(controllerFiles).forEach((controller) => {
  application.register(controller.default.name, controller.default);
});
