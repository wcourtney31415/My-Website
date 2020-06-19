module Phone.EmailComp exposing (emailComponent)

import BasicColors exposing (black, white)
import Data exposing (myEmail)
import Element
    exposing
        ( Attribute
        , Element
        , centerX
        , link
        , padding
        , row
        , spacing
        , text
        )
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import MessagesAndModels exposing (Msg(..))
import Phone.Colors
    exposing
        ( darkerBlue
        , gray
        , grayThirtyFour
        , lighterBlue
        , lightestBlue
        )
import Phone.TitleContentComp exposing (titleContentComp)


emailComponent : Element Msg
emailComponent =
    titleContentComp
        []
        { title = "Email"
        , titleAttr =
            [ Font.color white
            , Background.color darkerBlue
            ]
        , contentAttr =
            [ Font.color black
            , Background.color lighterBlue
            ]
        , contents = [ buttons ]
        }


buttons : Element Msg
buttons =
    row
        [ spacing 45
        , centerX
        ]
        [ btnEmailNow
        , btnEmailClipboard
        ]


btnAttributes : List (Attribute msg)
btnAttributes =
    [ Font.size 60
    , padding 30
    , Background.color gray
    , Border.rounded 18
    , Background.gradient
        { angle = 0
        , steps =
            [ lightestBlue
            , grayThirtyFour
            ]
        }
    ]


btnEmailNow : Element msg
btnEmailNow =
    link
        btnAttributes
        { url = "mailto:" ++ myEmail
        , label = text "Email Now"
        }


btnEmailClipboard : Element Msg
btnEmailClipboard =
    Input.button
        btnAttributes
        { onPress = Just <| CopyToClipboard myEmail
        , label = text "To Clipboard"
        }
