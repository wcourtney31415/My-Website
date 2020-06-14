module FontController exposing (remoteGoogleFont)

import Element exposing (Attribute)
import Element.Font as Font


getUntilDelimeter : String -> String
getUntilDelimeter str =
    let
        r_getUntilDelimeter : String -> String -> String
        r_getUntilDelimeter accumulator string =
            let
                delimeters =
                    "!@#$%^&*()<,>.?/:;[{}]|=_-"

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
                r_getUntilDelimeter nextAccumulator remainder
    in
    r_getUntilDelimeter "" str


removeLeading : String -> String
removeLeading url =
    String.replace "https://fonts.googleapis.com/css2?family=" "" url


remoteGoogleFont : String -> Attribute msg
remoteGoogleFont url =
    let
        withoutLead =
            removeLeading url

        name =
            String.replace "+" " " <| getUntilDelimeter withoutLead
    in
    Font.family
        [ Font.external
            { name = name
            , url = url
            }
        , Font.sansSerif
        ]
