module Colors exposing (..)

import HsvToRgb exposing (..)
import MessagesAndModels exposing (..)


type ColorProperty
    = Hue
    | Saturation
    | Value


colorList : ColorList
colorList =
    { header = { hue = 194, saturation = 0.73, value = 0.76 }
    , footer = { hue = 194, saturation = 0.73, value = 0.91 }
    , quoteBlock1 = { hue = 194, saturation = 0.73, value = 1 }
    , quoteBlock2 = { hue = 194, saturation = 0.73, value = 0.73 }
    , inlineTitleBar = { hue = 194, saturation = 0.73, value = 0.91 }
    , leftBlock = { hue = 0, saturation = 0, value = 0.93 }
    , rightBlock = { hue = 0, saturation = 0, value = 0.93 }
    }
