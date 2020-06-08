module Fonts exposing (..)

import Element.Font as Font


getUntilDelimeter : String -> String -> String
getUntilDelimeter accumulator string =
    let
        delimeters =
            "!@#$%^&*()<,>.?/:;[{}]|+=_-"

        isDelimeter : String -> Bool
        isDelimeter charAsStr =
            String.contains charAsStr delimeters

        len =
            String.length string

        first =
            String.slice 0 1 string

        remainder =
            String.slice 1 len string

        nextAccumulator =
            String.append accumulator first
    in
    if isDelimeter first then
        accumulator

    else
        getUntilDelimeter nextAccumulator remainder


remoteGoogleFont url =
    let
        withoutLead =
            String.replace "https://fonts.googleapis.com/css2?family=" "" url

        name =
            getUntilDelimeter "" withoutLead
    in
    Font.family
        [ Font.external
            { name = name
            , url = url
            }
        , Font.sansSerif
        ]


customFont =
    remoteGoogleFont "https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap"


customFont2 =
    remoteGoogleFont "https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap"
