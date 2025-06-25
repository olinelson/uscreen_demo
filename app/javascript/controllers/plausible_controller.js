import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="plausible"
export default class extends Controller {
  track(e) {
    const { event } = e.params
    if (typeof plausible !== "undefined") plausible(event)
  }
}
