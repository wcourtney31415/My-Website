function addClipboardPorts(elmApp) {
  if (elmApp.ports.copyToClipboard) {
    elmApp.ports.copyToClipboard.subscribe(copyToClipboard);
  }
}

function copyToClipboard(str) {
  navigator.clipboard.writeText(str).then(function() {
  }, function() {
  });
}
