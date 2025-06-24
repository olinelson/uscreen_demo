import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rich-text"
export default class extends Controller {
  static values = {
    // simple | detail
    view: "simple",
  }

  toggleView() {
    if (this.viewValue === "simple") this.viewValue = "detail"
    else this.viewValue = "simple"
  }

  onEnter(e) {
    if (this.viewValue === "simple") {
      e.preventDefault()
      this.dispatch("submitted")
    }
  }

  onCommandControlEnter(e) {
    e.preventDefault()
    this.dispatch("submitted")
  }
}
