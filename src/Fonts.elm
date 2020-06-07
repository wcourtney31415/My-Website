module Fonts exposing (..)

import Element.Font as Font


remoteGoogleFont url =
    let
        withoutLead =
            String.replace "https://fonts.googleapis.com/css2?family=" "" url

        splitOnColon =
            Maybe.withDefault "" (List.head <| String.split ":" withoutLead)

        splitOnAnd =
            Maybe.withDefault "" (List.head <| String.split "&" splitOnColon)

        derivedName =
            Maybe.withDefault "" (List.head <| String.split "+" splitOnAnd)
    in
    Font.family
        [ Font.external
            { name = derivedName
            , url = url
            }
        , Font.sansSerif
        ]


customFont =
    remoteGoogleFont "https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap"


customFont2 =
    remoteGoogleFont "https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap"
