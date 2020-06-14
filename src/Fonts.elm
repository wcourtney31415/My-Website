module Fonts exposing (fontDesktopHeader)

import Element exposing (Attribute)
import FontController exposing (remoteGoogleFont)


fontDesktopHeader : Attribute msg
fontDesktopHeader =
    remoteGoogleFont "https://fonts.googleapis.com/css2?family=PT+Serif:wght@700&display=swap"
