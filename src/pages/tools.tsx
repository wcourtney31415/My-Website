import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"
import { Field } from "@/components/ui/field"
import { Input } from "@/components/ui/input"
import { Item, ItemActions, ItemContent, ItemDescription, ItemMedia, ItemTitle } from "@/components/ui/item"
import type { Tool } from "@/data-content/types"
import { CodeXml } from "lucide-react"
import type { BaseSyntheticEvent } from "react"

const buildATool = (tool: any, index: number) => {
    return (
        <Item key={tool.key} variant={"outline"} className={"animate-animated-fade opacity-0"} style={{ '--delay': `${index * 0.1}s` } as React.CSSProperties}>
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

const getToolsMatchingSearch = (myTools: Tool[], searchText: String) => {
    const toolsMatchingSearch = myTools.filter((element) => {
        const titleUpper = element.title.toUpperCase();
        const searchTextUpper = searchText.toUpperCase();
        return titleUpper.includes(searchTextUpper);
    });
    return toolsMatchingSearch.map(buildATool);
}

// Page: Tools
const tools = (myTools: Tool[], searchText: String, onChangeFunc: (event: BaseSyntheticEvent) => void) => {
    console.log("Structure: ", myTools[0]);
    console.table(myTools[0]);
    return (
        <Card className="w-full h-full p-6">
            <Field className="flex max-w-100 self-center" orientation="horizontal">
                <Input type="search" placeholder="Search..." onChange={onChangeFunc} />
                <Button>Search</Button>
            </Field>
            <CardContent className="grid grid-cols-3 gap-4">
                {getToolsMatchingSearch(myTools, searchText)}
            </CardContent>
        </Card>
    )
}

export { tools }