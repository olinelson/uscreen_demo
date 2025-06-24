import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="direct-upload"
export default class extends Controller {
  static targets = ["input"]

  connect() {}
}
