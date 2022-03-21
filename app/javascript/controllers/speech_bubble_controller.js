import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message_area"]

  connect() {
    console.log('ready to resize!')
    console.log(this.message_areaTarget)
    this.resize()
  }

  resize() {
    let msgArea = this.message_areaTarget
    msgArea.style.height = "auto"
    msgArea.style.height = (msgArea.scrollHeight) + "px"
  }
}
