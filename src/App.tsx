import { useState } from "react";
import { Button } from "./components/ui/button"
import { ButtonGroup } from "./components/ui/button-group"
import { Card, CardContent } from "./components/ui/card"

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

  // Page: Myself
  const myself: React.JSX.Element = (
    <Card className="w-full h-full">
      <CardContent>
        <h1 className="scroll-m-20 text-4xl  tracking-tight text-balance">Myself</h1>
        <img src="https://wcourtney31415.github.io/My-Website/Images/me.png"></img>
      </CardContent>
    </Card>
  )

  // Page: Tools
  const tools: React.JSX.Element = (
    <Card className="w-full h-full">
      <CardContent>
        <div>Tools</div>
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
      </div>
    </div>
  )
}

export default App
