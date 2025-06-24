import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="confirm"
export default class extends Controller {
  static targets = ["message", "title"];
  resolve;

  #boundHandleKey;

  connect() {
    this.#boundHandleKey = this.handleKey.bind(this);
    Turbo.config.forms.confirm = (text) => {
      const [title, message] = text.split(":");
      this.titleTarget.innerText = title;
      if (message) this.messageTarget.innerText = message;
      this.addListeners();
      this.element.showModal();
      return new Promise((resolve) => (this.resolve = resolve));
    };
  }

  disconnect() {
    this.removeListeners();
  }

  addListeners() {
    document.addEventListener("keydown", this.#boundHandleKey);
  }

  removeListeners() {
    document.removeEventListener("keydown", this.#boundHandleKey);
  }

  handleKey(e) {
    if (e.key !== "Escape" && e.key !== "Esc") return;
    this.cancel();
    this.removeListeners();
  }

  ok() {
    this.resolve && this.resolve(true);
    this.element.close();
  }

  cancel() {
    this.resolve && this.resolve(false);
    this.element.close();
  }
}
