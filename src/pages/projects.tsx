import { Button } from "@/components/ui/button"
import { Card } from "@/components/ui/card"
import { Field } from "@/components/ui/field"
import { Input } from "@/components/ui/input"
import { Item, ItemContent, ItemDescription, ItemGroup, ItemHeader, ItemTitle } from "@/components/ui/item"
import type { Project } from "@/data-content/types"
import type { BaseSyntheticEvent } from "react"

const buildAProject = (project: any, index: number) => {
    return (
        <Item key={project.key} variant="outline" className="max-w-75 gap-2 animate-animated-fade opacity-0" style={{ '--delay': `${index * 0.1}s` } as React.CSSProperties}>
            <ItemHeader>
                <img
                    src={project.image}
                    alt={project.name}
                    className="w-fill rounded-sm mx-auto"
                />
            </ItemHeader>
            <ItemContent>
                <ItemTitle>{project.name}</ItemTitle>
                <ItemDescription>{project.description}</ItemDescription>
            </ItemContent>
        </Item>
    )
}

const getProjectsMatchingSearch = (myProjects: Project[], searchText: String) => {
    const projectsMatchingSearch = myProjects.filter((element) => {
        const titleUpper = element.name.toUpperCase();
        const searchTextUpper = searchText.toUpperCase();
        return titleUpper.includes(searchTextUpper);
    });
    return projectsMatchingSearch.map(buildAProject);
}

// Page: Projects
const projects = (myProjects: Project[], searchText: String, onChangeFunc: (event: BaseSyntheticEvent) => void) => {
    return (
        <Card className="w-full h-full p-6 ">
            <Field className="flex max-w-100 self-center" orientation="horizontal">
                <Input type="search" placeholder="Search..." onChange={onChangeFunc} />
                <Button>Search</Button>
            </Field>
            <ItemGroup className="grid grid-cols-4 gap-4">
                {getProjectsMatchingSearch(myProjects, searchText)}
            </ItemGroup>
        </Card>
    )
}

export { projects }