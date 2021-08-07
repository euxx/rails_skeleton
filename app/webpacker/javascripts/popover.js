document.addEventListener('turbolinks:load', () => {
  [].slice
    .call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    .map(e => new bootstrap.Popover(e))
})
