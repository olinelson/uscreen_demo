import { TurboMount } from "turbo-mount"
import { registerComponent } from "turbo-mount/react"
import VideoUpload from "react_components/VideoUpload"

const turboMount = new TurboMount()

console.log("HELLO TURBO MOUNT", turboMount)

registerComponent(turboMount, "VideoUpload", VideoUpload) // where Hello is the imported the component

// to register a component use:
// registerComponent(turboMount, "Hello", Hello); // where Hello is the imported the component

// to override the default controller use:
// registerComponent(turboMount, "Hello", Hello, HelloController); // where HelloController is a Stimulus controller extended from TurboMountController
