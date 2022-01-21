import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["body", "errorMessage"]
  static values = { questionFollowId: String }

  validations(event) {
    if (this.bodyTarget.textContent === "") {
      this.renderError(event, "Body can't be blank")
    } else if (this.bodyTarget.textContent.length <= 30) {
      this.renderError(event, "Body is too short (minimum is 30 characters)")
    }
  }

  renderError(event, message) {
    event.preventDefault()
    this.bodyTarget.classList.add("is-invalid")
    this.errorMessageTarget.innerHTML = message
  }

  reset() {
    this.bodyTarget.classList.remove("is-invalid")
    this.element.reset()
    this.followQuestion() // follow the question after user submits an answer
  }

  followQuestion() {
    const followForm = document.getElementById(this.questionFollowIdValue) 
    const followText = followForm.querySelector("button").innerHTML
    if (followText === "Follow") {
      followForm.requestSubmit()
    }
  }
  
}
