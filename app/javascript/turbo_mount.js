import { TurboMount } from "turbo-mount"
import { registerComponent } from "turbo-mount/react"
import Dropzone from "./react_components/Dropzone"

const turboMount = new TurboMount()

registerComponent(turboMount, "Dropzone", Dropzone) // where Hello is the imported the component

// to register a component use:
// registerComponent(turboMount, "Hello", Hello); // where Hello is the imported the component

// to override the default controller use:
// registerComponent(turboMount, "Hello", Hello, HelloController); // where HelloController is a Stimulus controller extended from TurboMountController
