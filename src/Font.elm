module Font exposing (..)

import Element.Font as Font


customFont =
    Font.family
        [ Font.external
            { name = "Lato"
            , url = "https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap"
            }
        , Font.sansSerif
        ]
