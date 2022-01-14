import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-question-form"
export default class extends Controller {
  reset() {
    this.element.reset()
  }
}
