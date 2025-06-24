import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dropzone"
export default class extends Controller {
  static values = {
    depth: 0,
    isOver: true,
  };
  static outlets = ["dropzone"];

  dragEnter(event) {
    event.preventDefault();
    this.depthValue++;
  }

  dragLeave(event) {
    event.preventDefault();
    this.depthValue--;
  }

  drop(event) {
    event.preventDefault();
    this.depthValue = 0;
  }

  reset() {
    this.depthValue = 0;
  }

  depthValueChanged(depth) {
    if (depth > 0) this.isOverValue = true;
    else this.isOverValue = false;
  }

  isOverValueChanged(isOverValue) {
    this.dropzoneOutlets.forEach((ol) => {
      ol.isOverValue = isOverValue;
    });
  }
}
