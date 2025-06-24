import { Controller } from "@hotwired/stimulus"
import { createElement } from "helpers/html"

// Connects to data-controller="modal-link"
export default class extends Controller {
  static values = {
    load: Boolean,
    template: String,
  }
  static outlets = ["modal"]

  load() {
    this.loadValue = true
  }

  loadValueChanged(load) {
    if (!load) return
    this.#createModalIfNotExists()
  }

  modalOutletDisconnected() {
    this.loadValue = false
  }

  open() {
    this.#createModalIfNotExists()
    this.modalOutlet.open()
  }

  #createModalIfNotExists() {
    if (this.hasModalOutlet) return
    const container = document.getElementById("modal_container")
    const div = createElement("div")
    div.innerHTML = this.templateValue
    container.appendChild(div)
  }
}
