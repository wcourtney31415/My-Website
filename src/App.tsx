import { useState, type BaseSyntheticEvent } from "react";
import { Button } from "./components/ui/button"
import { ButtonGroup } from "./components/ui/button-group"
import { myself } from "./pages/myself";
import { tools } from "./pages/tools";
import { projects } from "./pages/projects";
import toolsDataJson from './data-content/tools.json'
import projectsDataJson from './data-content/projects.json'

export function App() {

  // Create type to manage selected page
  type ActiveTab = "myself" | "tools" | "projects"

  // Create variable to manage page selection
  const [activeTab, setActiveTab] = useState<ActiveTab>("myself");

  const toolsWithKeys = toolsDataJson.tools.map(tool => ({ key: crypto.randomUUID(), ...tool }));

  const projectsWithKeys = projectsDataJson.projects.map(project => ({ key: crypto.randomUUID(), ...project }));

  const [myTools] = useState(toolsWithKeys);

  const [myProjects] = useState(projectsWithKeys);

  const [searchText, setSearchText] = useState("");

  const searchTextChange = (event: BaseSyntheticEvent) => {
    setSearchText(event.target.value);
  }

  // Return the selected page
  const getActivePage = () => {
    let page;
    switch (activeTab) {
      case "myself":
        page = myself
        break;
      case "tools":
        page = tools(myTools, searchText, searchTextChange)
        break;
      case "projects":
        page = projects(myProjects)
        break;
      default:
        page = <div>Unfortunately this page wasn't found.</div>
    }
    return page;
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

      </div>
    </div>
  )
}

export default App
