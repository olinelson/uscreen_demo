import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static values = {
    open: false,
    persist: true,
  }
  open() {
    this.openValue = true
  }
  close() {
    this.openValue = false
    if (!this.persistValue) this.element.remove()
  }
  openValueChanged(open) {
    if (open) this.element.showModal()
    else this.element.close()
  }
}
