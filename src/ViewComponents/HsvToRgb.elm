module ViewComponents.HsvToRgb exposing (hsv)

import Element exposing (..)


type alias Data =
    { h : Int
    , s : Float
    , v : Float
    , r : Int
    , g : Int
    , b : Int
    , rPrime : Float
    , gPrime : Float
    , bPrime : Float
    , c : Float
    , x : Float
    , m : Float
    }


given : Int -> Float -> Float -> Data
given myH myS myV =
    { h = myH
    , s = myS
    , v = myV
    , r = 0
    , g = 0
    , b = 0
    , rPrime = 0
    , gPrime = 0
    , bPrime = 0
    , c = 0
    , x = 0
    , m = 0
    }


hsv : Int -> Float -> Float -> Color
hsv h s v =
    given h s v |> print "Loaded Data: " |> solveC |> print "Solved C: " |> solveX |> print "Solved X: " |> solveM |> print "solved M:" |> calcRange |> print "Calculated Range: " |> solveRGB


print : String -> Data -> Data
print label data =
    Debug.log label data


solveC : Data -> Data
solveC data =
    { data | c = data.v * data.s }


solveM : Data -> Data
solveM data =
    { data | m = data.v - data.c }


solveX : Data -> Data
solveX data =
    { data | x = data.c * (1 - abs (floatMod (toFloat data.h / 60) 2 - 1)) }


floatMod a b =
    if a >= b then
        floatMod (a - b) b

    else
        a


calcRange : Data -> Data
calcRange data =
    if 0 <= data.h && data.h < 60 then
        { data | rPrime = data.c, gPrime = data.x, bPrime = 0 }

    else if 60 <= data.h && data.h < 120 then
        { data | rPrime = data.x, gPrime = data.c, bPrime = 0 }

    else if 120 <= data.h && data.h < 180 then
        { data | rPrime = 0, gPrime = data.c, bPrime = data.x }

    else if 180 <= data.h && data.h < 240 then
        { data | rPrime = 0, gPrime = data.x, bPrime = data.c }

    else if 240 <= data.h && data.h < 300 then
        { data | rPrime = data.x, gPrime = 0, bPrime = data.c }

    else if 300 <= data.h && data.h < 360 then
        { data | rPrime = data.c, gPrime = 0, bPrime = data.x }

    else
        data


unprime : Float -> Float -> Float
unprime myColor m =
    (myColor + m) * 255


solveRGB : Data -> Color
solveRGB data =
    let
        myR =
            round <| unprime data.rPrime data.m

        myG =
            round <| unprime data.gPrime data.m

        myB =
            round <| unprime data.bPrime data.m
    in
    rgb255 myR myG myB
