import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  requestSubmit() {
    this.element.requestSubmit()
  }
}
