import {Controller} from "@hotwired/stimulus"
import {turndownService} from "../../lib/turndown_service"

export default class extends Controller {
    click(event) {
        this.element.setAttribute("contenteditable", "true")
        this.element.focus()
    }

    blur(event) {
        this.element.removeAttribute("contenteditable")
        this.save()
    }

    keydown(event) {
        if (event.keyCode == 13) {
            event.preventDefault()
            this.element.removeAttribute("contenteditable")
        }
    }

    save() {
        // Convert the element this controller is attached to
        let markdown = turndownService().turndown(this.element)
        // Dynamically fill out the form data and submit
        this.element.querySelector("#data").value = markdown
        this.element.querySelector("form").requestSubmit()
    }
}