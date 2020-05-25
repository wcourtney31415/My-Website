function addResponsivePorts(elmApp) {
  if (elmApp.ports.onResizePort) {
    window.addEventListener("resize", onResize);
  }

  function onResize() {
    var size = {
      width: getResponsiveWidth(),
      height: getResponsiveHeight()
    };
    elmApp.ports.onResizePort.send(size);
  };
}


function getResponsiveWidth() {
  return window.screen.width;
}

function getResponsiveHeight() {
  return window.screen.height;
}