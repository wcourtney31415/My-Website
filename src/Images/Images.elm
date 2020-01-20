module Images.Images exposing (..)

import Element exposing (..)
import ModelAndMessages exposing (..)


pictureOfMe : List (Attribute Msg) -> Element Msg
pictureOfMe list =
    Element.image list
        { src = "/src/Images/Example.jpg"
        , description = "Wesley Courtney"
        }


elmLogo : List (Attribute Msg) -> Element Msg
elmLogo list =
    Element.image list
        { src = "/src/Images/ElmLogo.png"
        , description = "Elm"
        }


javaLogo : List (Attribute Msg) -> Element Msg
javaLogo list =
    Element.image list
        { src = "/src/Images/JavaLogo.png"
        , description = "Java"
        }


visualStudioLogo : List (Attribute Msg) -> Element Msg
visualStudioLogo list =
    Element.image list
        { src = "/src/Images/VSLogo.png"
        , description = "Visual Studio"
        }


arduinoLogo : List (Attribute Msg) -> Element Msg
arduinoLogo list =
    Element.image list
        { src = "/src/Images/ArduinoLogo.png"
        , description = "Arduino"
        }
