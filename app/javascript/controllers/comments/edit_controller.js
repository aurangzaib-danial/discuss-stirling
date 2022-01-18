import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments--edit"
export default class extends Controller {
  static targets = ["pencil", "form", "content", "body"]

  edit(event) {
    event.preventDefault()
    this.pencilTarget.classList.add("d-none")
    this.contentTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }
}
