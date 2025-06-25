import { Controller } from "@hotwired/stimulus"
import { copyText } from "../helpers/clipboard"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static values = {
    toCopy: String,
    copied: false,
  }
  copy() {
    copyText(this.toCopyValue)
    this.copiedValue = true
    setTimeout(() => (this.copiedValue = false), 3000)
  }
}
