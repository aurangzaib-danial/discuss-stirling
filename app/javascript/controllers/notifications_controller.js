import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notifications"
export default class extends Controller {
  static targets = ["unreadCount", "markAsReadForm"]
  connect() {
    // Set polling
    // Re
  }
  
  markAsRead() {
    if (parseInt(this.unreadCountTarget.innerHTML) > 0) {
      this.unreadCountTarget.innerHTML = "0"
      this.unreadCountTarget.classList.add("d-none")
      this.markAsReadFormTarget.requestSubmit()
    }
  }
}
