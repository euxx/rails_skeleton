// Entry point for the build script in your package.json
import '@fortawesome/fontawesome-free/js/all.min'
import '@hotwired/turbo-rails'
import './controllers'
import * as bootstrap from 'bootstrap/dist/js/bootstrap.min.js'
window.bootstrap = bootstrap;
import './javascripts/popover'
