port module Ports.Ports exposing (copyToClipboard, onResize)


port copyToClipboard : String -> Cmd msg


port onResizePort : (Size -> msg) -> Sub msg


type alias Size =
    { width : Int
    , height : Int
    }


onResize : (Int -> Int -> msg) -> Sub msg
onResize intListener =
    let
        sizeListener =
            \size -> intListener size.width size.height
    in
    onResizePort sizeListener
