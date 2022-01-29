import { Controller } from "@hotwired/stimulus"

import { get, patch } from '@rails/request.js'

// Connects to data-controller="notifications"
export default class extends Controller {
  static targets = ["unreadCount"]
  
  connect() {
    this.startRefreshing()
  }
  
  async markAsRead() {
    if (parseInt(this.unreadCountTarget.innerHTML) > 0) {
      this.unreadCountTarget.innerHTML = "0"
      this.unreadCountTarget.classList.add("d-none")
      
      await patch("/notifications/mark_as_read")
    }
  }

  async load() {
    await get("/notifications", {responseKind: "turbo-stream"})
  }

  startRefreshing() {
    this.refreshTimer = setInterval(() => {
      this.load()
    }, 5000)
  }

  stopRefreshing() {
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer)
    }
  }

  disconnect() {
    this.stopRefreshing()
  }
}

