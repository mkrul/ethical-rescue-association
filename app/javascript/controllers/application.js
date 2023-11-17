import { Application } from "@hotwired/stimulus"
import * as ActiveStorage from "@rails/activestorage"
import { Controller } from "@hotwired/stimulus"

ActiveStorage.start()

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export default class extends Controller {
  static values = { message: String };

  confirm(event) {
    if (!(window.confirm(this.messageValue))) {
      event.preventDefault();
      event.stopImmediatePropagation();
    };
  };
}

export { application }