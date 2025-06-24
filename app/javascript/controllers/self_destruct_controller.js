import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="self-destruct"
export default class extends Controller {
  static values = {
    ttl: { type: Number, default: 5000 },
  }
  connect() {
    setTimeout(() => this.destroy(), this.ttlValue)
  }

  destroy() {
    this.element.remove()
  }
}
