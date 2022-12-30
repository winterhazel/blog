import {Controller} from "@hotwired/stimulus"

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
        // TODO
    }
}