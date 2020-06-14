module Phone.ContentComp exposing (contentComp)

import Element
    exposing
        ( Color
        , Element
        , centerX
        , centerY
        , padding
        )
import Element.Background as Background
import Element.Border as Border
import Phone.Shadow exposing (phoneShadow)


contentComp : Color -> List (Element msg) -> Element msg
contentComp bkgColor contents =
    Element.column
        [ centerX
        , Border.rounded 32
        , centerY
        , phoneShadow
        , Background.color bkgColor
        , Border.rounded 25
        , padding 30
        ]
        contents
