
const copyToClipboard = (stringToCopy: string, toast: any ) => {
    navigator.clipboard.writeText(stringToCopy)
        .then(_ => {
            toast.success(`Successfully copied "${stringToCopy}" to clipboard.`, toastSettings);
        })
        .catch(_ => {
        });
}

const sendEmail = (emailAddress: string, toast: any) => {
    console.table(typeof toast);
    const url = `mailto:${emailAddress}`;
    toast.info(`Launching default mail application...`, toastSettings)
    window.location.href = url;
}

const toastSettings = { position: "top-right" };

export {copyToClipboard, toastSettings, sendEmail}