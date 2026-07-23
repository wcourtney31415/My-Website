import { Button } from "@/components/ui/button"
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from "@/components/ui/dropdown-menu"
import { copyToClipboard, sendEmail } from "@/helper-functions/helper-functions";
import { toast, Toaster } from "sonner";



const inlineEmailButton: React.JSX.Element = (
    <DropdownMenu>
        <DropdownMenuTrigger render={<Button variant="outline" />}>
            wcourtney31415@gmail.com
        </DropdownMenuTrigger>
        <DropdownMenuContent>
            <DropdownMenuItem
                onClick={_ => { sendEmail("wcourtney31415@gmail.com", toast) }}
            >
                ✉️ Send Email
            </DropdownMenuItem>
            <DropdownMenuItem
                onClick={_ => copyToClipboard("wcourtney31415@gmail.com", toast)}
            >
                📋 Copy to Clipboard
            </DropdownMenuItem>
        </DropdownMenuContent>
        <Toaster />
    </DropdownMenu>
)

export { inlineEmailButton }