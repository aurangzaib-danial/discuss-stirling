import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {
  static targets = ["form", "body", "addComment"]

  newComment(event) {
    event.preventDefault()
    this.addCommentTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
    this.bodyTarget.focus()
  }

  reset() {
    this.formTarget.reset()
    this.formTarget.classList.add("d-none")
    this.addCommentTarget.classList.remove("d-none")
  }
}
