import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {
  static targets = ["form", "body", "addComment"]
  static values = { followableId: String }

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
    this.followFollowable() // follow the followable(question/answer) after user submits a comment
  }

  followFollowable() {
    const followForm = document.getElementById(this.followableIdValue) 
    const followText = followForm.querySelector("button").innerHTML
    if (followText === "Follow") {
      followForm.requestSubmit()
    }
  }
}
