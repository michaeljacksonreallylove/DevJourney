import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"
import "bootstrap"

export const application = Application.start()

import "./controllers"
