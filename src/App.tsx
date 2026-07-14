import { useState } from "react";
import { Button } from "./components/ui/button"
import { ButtonGroup } from "./components/ui/button-group"
import { Card, CardContent } from "./components/ui/card"
import { toast, Toaster, type ExternalToast } from "sonner";
import { DropdownMenu, DropdownMenuContent, DropdownMenuGroup, DropdownMenuItem, DropdownMenuTrigger } from "./components/ui/dropdown-menu";
import { Item, ItemActions, ItemContent, ItemDescription, ItemMedia, ItemTitle } from "./components/ui/item";
import { CodeXml, } from "lucide-react"


export function App() {

  // Create type to manage selected page
  type ActiveTab = "myself" | "tools" | "projects"

  // Create variable to manage page selection
  const [activeTab, setActiveTab] = useState<ActiveTab>("myself");

  // Return the selected page
  const getActivePage = () => {
    let page;
    switch (activeTab) {
      case "myself":
        page = myself
        break;
      case "tools":
        page = tools
        break;
      case "projects":
        page = projects
        break;
      default:
        page = <div>Unfortunately this page wasn't found.</div>
    }
    return page;
  }

  const inlineEmailButton: React.JSX.Element = (
    <DropdownMenu>
      <DropdownMenuTrigger render={<Button variant="outline" />}>
        wcourtney31415@gmail.com
      </DropdownMenuTrigger>
      <DropdownMenuContent>
        <DropdownMenuItem
          onClick={_ => { sendEmail("wcourtney31415@gmail.com") }}
        >
          ✉️ Send Email
        </DropdownMenuItem>
        <DropdownMenuItem
          onClick={_ => copyToClipboard("wcourtney31415@gmail.com")}
        >
          📋 Copy to Clipboard
        </DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  )

  // Page: Myself
  const myself: React.JSX.Element = (
    <Card className="w-full h-full">
      <CardContent className="flex flex-col gap-4">
        <h1 className="flex mx-auto scroll-m-20 text-4xl  tracking-tight text-balance">About Myself</h1>
        <img className="flex mx-auto w-48 border-5 rounded-full border-accent-foreground" src="https://wcourtney31415.github.io/My-Website/Images/me.png"></img>
        <p>Welcome to my site! My name is Wes Courtney, and I am a software developer. Coding is my passion and I have been doing it for 19 years.</p>
        <p>My career in software development began with video game design when I was in 5th grade.</p>
        <p>Over the years I found that my gratification wasn't exclusive to game design but was instead the product of coding itself. This broadened my horizon, and opened me up to new languages and paradigms.</p>
        <p>Today I code in my professional endeavors, and also as a hobby, and aspire to make a full time career of it.</p>
        <p>For career related inquiries, contact me at {inlineEmailButton}</p>
      </CardContent>
    </Card>
  )

  const myTools = [
    {
      iconType: "language"
      , title: "React"
      , description: "The library for web and native user interfaces"
      , url: "https://www.react.dev"
    }
    , {
      iconType: "language"
      , title: "Vue"
      , description: "An approachable, performant and versatile framework for building web user interfaces"
      , url: "https://www.vuejs.org/"
    }
    , {
      iconType: "language"
      , title: "Elm"
      , description: "A delightful language for reliable web applications"
      , url: "https://elm-lang.org/"
    }
    , {
      iconType: "language"
      , title: "Haskell"
      , description: "Haskell is a purely functional programming language that features referential transparency, immutability and lazy evaluation"
      , url: "https://www.haskell.org/"
    }
    , {
      iconType: "language"
      , title: "Java"
      , description: "Java is a programming language and computing platform first released by Sun Microsystems in 1995"
      , url: "https://www.java.com"
    }
    , {
      iconType: "language"
      , title: "C#"
      , description: "The C# language is the most popular language for the .NET platform, a free, cross-platform, open source development environment"
      , url: "https://learn.microsoft.com/en-us/dotnet/csharp/"
    }
  ]

  const buildATool = tool => {
    return (
      <Item variant={"outline"}>
        <ItemMedia variant="icon">
          <CodeXml className="size-5" />
        </ItemMedia>
        <ItemContent>
          <ItemTitle>{tool.title}</ItemTitle>
          <ItemDescription>{tool.description}</ItemDescription>
        </ItemContent>
        <ItemActions>
          <Button onClick={_ => window.open(tool.url, '_blank')}>Website</Button>
        </ItemActions>
      </Item>
    )
  }

  // Page: Tools
  const tools: React.JSX.Element = (
    <Card className="w-full h-full">
      <CardContent className="grid grid-cols-3 gap-4">
        {myTools.map(buildATool)}
      </CardContent>
    </Card>
  )

  // Page: Projects
  const projects: React.JSX.Element = (
    <Card className="w-full h-full">
      <CardContent>
        <div>Projects</div>
      </CardContent>
    </Card>
  )

  const sendEmail = (emailAddress: string) => {
    const url = `mailto:${emailAddress}`;
    toast.info(`Launching default mail application...`, toastSettings)
    window.location.href = url;
  }


  const toastSettings: ExternalToast = { position: "top-right" };

  const copyToClipboard = (stringToCopy: string) => {
    navigator.clipboard.writeText(stringToCopy)
      .then(_ => {
        toast.success(`Successfully copied "${stringToCopy}" to clipboard.`, toastSettings);
      })
      .catch(_ => {
        toast.error(`Failed to copy to clipboard.`, toastSettings);
      });
  }

  // Main Page
  return (
    <div className="flex min-h-svh p-6 w-full">
      <div className="flex min-w-0 flex-col gap-4 text-sm leading-loose w-full">
        <ButtonGroup>
          <Button onClick={_ => setActiveTab("myself")}>Myself</Button>
          <Button onClick={_ => setActiveTab("tools")}>My Tools</Button>
          <Button onClick={_ => setActiveTab("projects")}>My Projects</Button>
        </ButtonGroup>
        {getActivePage()}
        <Toaster />
      </div>
    </div>
  )
}

export default App
