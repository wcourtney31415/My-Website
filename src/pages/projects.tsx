import { Card } from "@/components/ui/card"
import { Item, ItemContent, ItemDescription, ItemGroup, ItemHeader, ItemTitle } from "@/components/ui/item"
import type { Project } from "@/data-content/types"

const buildAProject = (project: any, index: number) => {
    return (
        <Item
            key={project.key}
            variant="outline"
            className="h-auto max-w-75 gap-2 animate-animated-fade opacity-0 cursor-pointer hover:scale-105"
            style={{ '--delay': `${index * 0.1}s` } as React.CSSProperties}
            onClick={_ => window.location.href = project.url}
        >
            <ItemHeader>
                <img
                    src={project.image}
                    alt={project.name}
                    className="w-fill rounded-sm mx-auto"
                />
            </ItemHeader>
            <ItemContent>
                <ItemTitle onClick={_ => window.location.href = project.url}>{project.name}</ItemTitle>
                <ItemDescription>{project.description}</ItemDescription>
            </ItemContent>-
        </Item>
    )
}

// Page: Projects
const projects = (myProjects: Project[]) => {
    return (
        <Card className="w-full h-full p-6 ">
            <ItemGroup className="grid grid-cols-4 gap-4">
                {myProjects.map(buildAProject)}
            </ItemGroup>
        </Card>
    )
}

export { projects }