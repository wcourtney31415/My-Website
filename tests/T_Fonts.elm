module T_Fonts exposing (..)

import Element.Font as Font
import Expect exposing (Expectation)
import FontController exposing (..)
import Fonts exposing (..)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


googleFontParsing1 : Test
googleFontParsing1 =
    let
        url =
            "https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap"

        result =
            getUntilDelimeter <| removeLeading url

        expected =
            "Lato"
    in
    test ("1st: " ++ result ++ " is equal to " ++ expected ++ "?")
        (\_ -> Expect.equal expected result)


googleFontParsing2 : Test
googleFontParsing2 =
    let
        url =
            "https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap"

        result =
            getUntilDelimeter <| removeLeading url

        expected =
            "Playfair+Display"
    in
    test ("2nd: " ++ result ++ " is equal to " ++ expected ++ "?")
        (\_ -> Expect.equal expected result)


googleFontToAttr : Test
googleFontToAttr =
    let
        url =
            "https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap"

        result =
            remoteGoogleFont url

        expected =
            Font.family
                [ Font.external
                    { name = "Playfair Display"
                    , url = "https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap"
                    }
                , Font.sansSerif
                ]
    in
    test "Attribute Generation"
        (\_ -> Expect.equal expected result)
