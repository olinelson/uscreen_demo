import { Controller } from "@hotwired/stimulus"
import { pageIsTurboPreview } from "helpers/turbo"

export default class extends Controller {
  static values = { id: String }
  #player
  connect() {
    if (pageIsTurboPreview()) return
    this.#player = videojs(this.idValue, {}, function onPlayerReady() {
      this.on("error", function (e) {
        videojs.log("Error", e)
      })
    })
  }

  disconnect() {
    this.#player?.dispose()
  }
}
