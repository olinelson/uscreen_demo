import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="link-new-tab"
export default class extends Controller {
  onClick(e) {
    const el = e.target
    if (el.tagName === "A") el.setAttribute("target", "_blank")
  }
}
