import type { ExternalToast } from "sonner";

const copyToClipboard = (stringToCopy: string, toast: any) => {
    navigator.clipboard.writeText(stringToCopy)
        .then(_ => {
            toast.success(`Successfully copied "${stringToCopy}" to clipboard.`, toastSettings);
        })
        .catch(_ => {
        });
}

const toastSettings: ExternalToast = { position: "top-right" };

export {copyToClipboard, toastSettings}