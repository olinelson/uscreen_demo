import { Controller } from "@hotwired/stimulus"

import confetti from "canvas-confetti"

// Connects to data-controller="confetti"
export default class extends Controller {
  connect() {
    confetti({
      particleCount: 100,
      spread: 70,
      origin: { y: 0.6 },
      zIndex: 1000,
    })
  }
}
