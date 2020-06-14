module Phone.Shadow exposing (phoneShadow)

import BasicColors exposing (shadowColor)
import Element exposing (Attr)
import Element.Border as Border


phoneShadow : Attr decorative msg
phoneShadow =
    Border.shadow
        { offset = ( 10, 10 )
        , size = 1
        , blur = 20
        , color = shadowColor
        }
