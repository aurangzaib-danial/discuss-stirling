import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {
  static targets = ["form", "body", "addComment"]

  newComment(event) {
    event.preventDefault()
    this.addCommentTarget.style.display = "none"
    this.formTarget.style.display = "initial"
    this.bodyTarget.focus()
  }

  reset() {
    this.formTarget.reset()
    this.formTarget.style.display = "none"
    this.addCommentTarget.style.display = "initial"
  }
}
