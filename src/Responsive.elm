port module Responsive exposing (onResize)


type alias Size =
    { width : Int, height : Int }


port onResizePort : (Size -> msg) -> Sub msg


onResize : (Int -> Int -> msg) -> Sub msg
onResize intListener =
    let
        sizeListener =
            \size -> intListener size.width size.height
    in
    onResizePort sizeListener
