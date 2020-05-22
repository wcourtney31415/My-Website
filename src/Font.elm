module Font exposing (..)

import Element.Font as Font


customFont =
    Font.family
        [ Font.external
            { name = "Montez"
            , url = "https://fonts.googleapis.com/css2?family=Herr+Von+Muellerhoff&family=Montez&display=swap"
            }
        , Font.sansSerif
        ]
