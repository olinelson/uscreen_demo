# Pin npm packages by running ./bin/importmap

pin "application"
pin "turbo_mount_application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/helpers", under: "helpers"
pin_all_from "app/javascript/react_components", under: "react_components"
pin "canvas-confetti" # @1.9.3
pin "@rails/activestorage", to: "@rails--activestorage.js" # @8.0.200
pin "trix" # @2.1.15
pin "@rails/actiontext", to: "@rails--actiontext.js" # @8.0.200
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "react" # @19.1.0
pin "react-dom" # @19.1.0
pin "react-dom/client", to: "react-dom--client.js" # @19.1.0
pin "scheduler" # @0.26.0
pin "turbo-mount" # @0.4.3
pin "turbo-mount/react", to: "turbo-mount--react.js" # @0.4.3
