// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "trix";
import "@rails/actiontext";
import * as ActiveStorage from "@rails/activestorage";

ActiveStorage.start();

Trix.config.toolbar.getDefaultHTML = () => {
  const el = document.getElementById("default-trix-toolbar");
  return el.outerHTML;
};

import "trix"
import "@rails/actiontext"
