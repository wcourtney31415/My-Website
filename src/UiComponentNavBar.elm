module UiComponentNavBar exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import MessagesAndModels exposing (..)
import ResourceColors exposing (..)
import ResourceTexts exposing (..)


navBar : Model -> List (Element Msg)
navBar model =
    [ navBarButton model "Hire Me" HireMe
    , navBarButton model "Language Preferences" LanguagePreferences
    , navBarButton model "My Story" MyStory
    , navBarLink model "Site Source Code" myGitHub
    ]


navBarButton : Model -> String -> Page -> Element Msg
navBarButton model label page =
    let
        underline =
            if model.selectedPage == page then
                [ Border.widthEach
                    { bottom = 2
                    , left = 0
                    , right = 0
                    , top = 0
                    }
                ]

            else
                []
    in
    Input.button
        ([ alignRight
         , Font.color white
         , Border.color white
         , paddingXY 0 4
         ]
            ++ underline
        )
        { onPress = Just (NavBarButtonClicked { model | selectedPage = page })
        , label = text label
        }


navBarLink : Model -> String -> String -> Element Msg
navBarLink model label url =
    link
        [ alignRight
        , Font.color white
        ]
        { url = url
        , label = text label
        }
