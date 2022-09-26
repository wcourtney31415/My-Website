module Data exposing
    ( aboutMeRawText1
    , aboutMeRawText2
    , aboutMeRawText3
    , aboutMeRawText4
    , backgroundPath
    , gitHub
    , indent
    , myEmail
    , myName
    , siteSource
    , tabBackgroundPath
    , facePath
    )


indent : Int -> String
indent len =
    String.concat <| List.repeat len "\u{00A0}"


myName : String
myName =
    "Wesley Courtney"


backgroundPath : String
backgroundPath =
    "./Images/background.jpg"


facePath : String
facePath =
    "./Images/me.png"


tabBackgroundPath : String
tabBackgroundPath =
    "./Images/tab-background.jpg"


myEmail : String
myEmail =
    "wcourtney31415@gmail.com"


gitHub : String
gitHub =
    "https://github.com/wcourtney31415"


siteSource : String
siteSource =
    "https://github.com/wcourtney31415/My-Website"


aboutMeRawText1 : String
aboutMeRawText1 =
    "\tMy introduction to the world of programming began at the age of ten. In fifth grade my best friend and I discovered a video game development platform known as Gamemaker. We became quite capable in it’s scripting language through the years as we worked on our hobby projects. Between this and dabbling in C++, I found my passion. I knew since the beginning I wanted to write code, but once I enrolled in college I came to the conclusion that it was software development in general I was drawn to, not just video games. Throughout my college career, I experimented with various languages. My primary being Java, and I found I was drawn to application and server side development."


aboutMeRawText2 : String
aboutMeRawText2 =
    "I worked as an IT administrator for several years, working on PC’s and servers for various companies."


aboutMeRawText3 : String
aboutMeRawText3 =
    "\tTowards the beginning of 2020 I took some time to study functional programming. I taught myself Elm, and then soon after Haskell. It has shifted my way of coding for the better, and has made me a better programmer. Additionally, I’ve gotten much better at front end development using Elm, which was the inspiration for making this website."


aboutMeRawText4 : String
aboutMeRawText4 =
    "\tProgramming is my passion, and I’m looking forward to turning it into a career. I’m eager to join a team where I can challenge myself, improve my trade, and create/maintain powerful tools. "
