import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropzone"
export default class extends Controller {
  static values = {
    isOver: false,
  }
  static outlets = ["drag-drop-observer"]

  dragOver(event) {
    event.preventDefault()
  }

  dragLeave(event) {
    event.preventDefault()
  }

  drop(event) {
    event.preventDefault()
    this.dispatch("dropped", { detail: { files: event.dataTransfer.files } })
    this.dragDropObserverOutlet.reset()
  }
}
