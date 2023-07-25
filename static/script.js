const client = filestack.init('ATf068C1VQ3KS17hx3YiAz');

const options = {
    fromSources: ["local_file_system"],
    accept: ['.png', '.jpeg'],
    acceptFn: (file, options) => {
        const mimeFromExtension = options.mimeFromExtension(file.originalFile.name);
        if (options.acceptMime.length && !options.acceptMime.includes(mimeFromExtension)) {
            return Promise.reject('Cannot accept that file')
        }
        return Promise.resolve()
    },
    storeTo: {
        workflows: ["5e80b68c-fe69-4778-a7fc-99d0e48e5786"]
    },
    onUploadDone: function (data) {
        console.log(data);

        for (file of data.filesUploaded) {
            let input = document.createElement("input");
            input.setAttribute("type", "hidden");
            input.setAttribute("name", "file-uploaded");
            input.setAttribute("value", JSON.stringify(file));
            document.getElementById("filestack-handles").appendChild(input);

            let li = document.createElement("li");
            li.innerText = file.filename;
            document.getElementById("uploaded-filenames").appendChild(li);
        }
    }
}
document.getElementById("upload-btn").addEventListener("click", function (event) {
    event.preventDefault();
    client.picker(options).open();
})

