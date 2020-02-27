module ResourceImages exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import MessagesAndModels exposing (..)



{- /////////////////////        RESOURCES BELOW          //////////////////// -}
{- /////////////////////        Resources: Images        //////////////////// -}


pictureOfMe : List (Attribute Msg) -> Element Msg
pictureOfMe list =
    Element.image list
        { src = "./Images/Example.jpg"
        , description = "Wesley Courtney"
        }


elmLogo : List (Attribute Msg) -> Element Msg
elmLogo list =
    Element.image list
        { src = "./Images/ElmLogo.png"
        , description = "Elm  Logo"
        }


javaLogo : List (Attribute Msg) -> Element Msg
javaLogo list =
    Element.image list
        { src = "./Images/JavaLogo.png"
        , description = "Java  Logo"
        }


visualStudioLogo : List (Attribute Msg) -> Element Msg
visualStudioLogo list =
    Element.image list
        { src = "./Images/VSLogo.png"
        , description = "Visual Studio  Logo"
        }


arduinoLogo : List (Attribute Msg) -> Element Msg
arduinoLogo list =
    Element.image list
        { src = "./Images/ArduinoLogo.png"
        , description = "Arduino Logo"
        }


gameMakerLogo : List (Attribute Msg) -> Element Msg
gameMakerLogo list =
    Element.image list
        { src = "./Images/GameMakerLogo.png"
        , description = "Game Maker Logo"
        }


ivyTechLogo : List (Attribute Msg) -> Element Msg
ivyTechLogo list =
    Element.image list
        { src = "./Images/IVYTechLogo.png"
        , description = "IVY Tech Community College Logo"
        }


cPlusPlusLogo : List (Attribute Msg) -> Element Msg
cPlusPlusLogo list =
    Element.image list
        { src = "./Images/CPlusPlusLogo.png"
        , description = "C++ Logo"
        }
