document.addEventListener('turbo:load', () => {
  [].slice
    .call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    .map(e => new bootstrap.Popover(e))
})
