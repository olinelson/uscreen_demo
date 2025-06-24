import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="trix-button"
export default class extends Controller {
  #observer;
  #onMutate = (mutations) => {
    mutations.forEach((mutation) => {
      if (mutation.attributeName !== "data-trix-active") return;
      const hasAttribute = this.element.hasAttribute("data-trix-active");
      if (hasAttribute) this.element.classList.add("btn-active");
      else this.element.classList.remove("btn-active");
    });
  };

  connect() {
    this.#observer = new MutationObserver(this.#onMutate);
    this.#observer.observe(this.element, {
      attributes: true,
      attributeFilter: ["data-trix-active"],
    });
  }

  disconnect() {
    this.#observer?.disconnect();
  }
}
