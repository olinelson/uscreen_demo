import React, { useEffect, useRef, useState } from "react"
import { DirectUpload } from "@rails/activestorage"

export default function Dropzone({
  url,
  name,
  accept,
  acceptDescription,
  downloadIcon,
  circleCheckIcon,
}) {
  const fileInputRef = useRef(null)
  const hiddenInputRef = useRef(null)
  const [uploading, setUploading] = useState(false)
  const [progress, setProgress] = useState(0)
  const [error, setError] = useState(null)
  const [file, setFile] = useState(null)
  const fileUploadComplete = progress == 100 && file

  useEffect(() => {
    if (!file) return
    handleFileUpload(file)
  }, [file])

  const handleFileUpload = (file) => {
    if (!isFileValid(file)) return setError(acceptDescription)
    setUploading(true)
    setError(null)
    setProgress(0)

    const upload = new DirectUpload(file, url, {
      directUploadWillStoreFileWithXHR,
    })

    upload.create((error, blob) => {
      if (error) {
        console.error(error)
        setError("Upload failed. Please try again.")
        setUploading(false)
        return
      }
      hiddenInputRef.current.value = blob.signed_id
      setUploading(false)
      setProgress(100)
    })
  }

  const isFileValid = (file) => {
    return accept.split(",").some((allowedType) => {
      if (allowedType.endsWith("/*")) {
        const baseType = allowedType.split("/").at(0)
        return file.type.startsWith(`${baseType}/`)
      }
      return file.type === allowedType
    })
  }

  const directUploadWillStoreFileWithXHR = (request) => {
    request.upload.addEventListener("progress", (event) => {
      if (!event.lengthComputable) return
      const progressPercent = Math.round((event.loaded / event.total) * 100)
      setProgress(progressPercent)
    })
  }

  const handleDrop = (event) => {
    event.preventDefault()
    const file = event.dataTransfer.files[0]
    setFile(file)
  }

  const handleInputChange = (event) => {
    const file = event.target.files[0]
    setFile(file)
  }

  const FileSuccess = () => (
    <div class="grid place-items-center gap-2">
      <div dangerouslySetInnerHTML={{ __html: circleCheckIcon }} />
      <h4 class="flex gap-1">
        <span class="truncate max-w-20 overflow-hidden text-ellipsis whitespace-nowrap block">
          {file.name}
        </span>{" "}
        Uploaded
      </h4>
    </div>
  )

  const Uploading = () => (
    <div className="grid place-items-center gap-2">
      <span className="loading loading-spinner loading-md"></span>
      <p className="mt-2">Uploading... {progress}%</p>
    </div>
  )

  const Ready = () => (
    <div className="grid place-items-center gap-2">
      <div dangerouslySetInnerHTML={{ __html: downloadIcon }} />
      <p> Drag and drop a file here, or click to upload</p>
    </div>
  )

  return (
    <div>
      <label>
        <div className="flex flex-col items-center w-full">
          <div
            className="h-40 border-2 border-dashed border-gray-300 rounded-lg p-4 cursor-pointer grid place-items-center w-full"
            onDrop={handleDrop}
            onDragOver={(e) => e.preventDefault()}
          >
            {fileUploadComplete ? (
              <FileSuccess />
            ) : uploading ? (
              <Uploading />
            ) : (
              <Ready />
            )}
          </div>
          <p className="text-red-500 mt-2 empty:invisible">{error}</p>
          <input
            type="file"
            ref={fileInputRef}
            className="hidden"
            onChange={handleInputChange}
            accept={accept}
          />
        </div>
      </label>

      <input type="hidden" name={name} ref={hiddenInputRef} />
    </div>
  )
}
