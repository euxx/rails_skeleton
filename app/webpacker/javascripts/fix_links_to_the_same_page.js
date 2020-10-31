// Aviod unnecessary requests by turbolinks when links to the same page
// https://github.com/turbolinks/turbolinks/issues/75#issuecomment-445325162

document.addEventListener('turbolinks:click', event => {
  const link = event.target
  const isLinkToTheSamePage = (
    link.hash &&
    link.origin === window.location.origin &&
    link.pathname === window.location.pathname
  )

  if (isLinkToTheSamePage) {
    Turbolinks.controller.pushHistoryWithLocationAndRestorationIdentifier(
      event.data.url,
      Turbolinks.uuid()
    )
    event.preventDefault()
  }
})
