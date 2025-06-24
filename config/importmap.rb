# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/helpers", under: "helpers"
pin "canvas-confetti" # @1.9.3
pin "@rails/activestorage", to: "@rails--activestorage.js" # @8.0.200
pin "trix" # @2.1.15
pin "@rails/actiontext", to: "@rails--actiontext.js" # @8.0.200
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
