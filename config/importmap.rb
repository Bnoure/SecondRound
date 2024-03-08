# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "swiper" # @11.0.7
pin "swing" # @3.1.4
pin "hammerjs" # @2.0.8
pin "lodash" # @4.17.21
pin "performance-now" # @2.1.0
pin "process" # @2.0.1
pin "raf" # @3.4.1
pin "rebound" # @0.0.13
pin "sister" # @3.0.2
pin "vendor-prefix" # @0.1.0
