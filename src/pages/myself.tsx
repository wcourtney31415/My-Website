import { Card, CardContent } from "@/components/ui/card"
import { inlineEmailButton } from "@/my-components/email"

// Page: Myself
const myself: React.JSX.Element = (
    <Card className="w-full h-full">
        <CardContent className="flex flex-col gap-4">
            <h1 className="flex mx-auto scroll-m-20 text-4xl  tracking-tight text-balance">About Myself</h1>
            <img className="flex mx-auto w-48 border-5 rounded-full border-accent-foreground" src="https://media.licdn.com/dms/image/v2/D4E03AQG5RdtdzE5QGg/profile-displayphoto-scale_400_400/B4EZ9x6d7fIAAk-/0/1784322582250?e=1786579200&v=beta&t=c3kN38sbz9ciDsP1U95iDEvmtKsBg4Fyfazem4IZu1s"></img>
            <p>Welcome to my site! My name is Wes Courtney, and I am a software developer. Coding is my passion and I have been doing it for 19 years.</p>
            <p>My career in software development began with video game design when I was in 5th grade.</p>
            <p>Over the years I found that my gratification wasn't exclusive to game design but was instead the product of coding itself. This broadened my horizon, and opened me up to new languages and paradigms.</p>
            <p>Today I code in my professional endeavors, and also as a hobby, and aspire to make a full time career of it.</p>
            For career related inquiries, contact me at {inlineEmailButton}
        </CardContent>
    </Card>
)

export {myself}