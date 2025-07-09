import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "confirm"
  static values = {
    title: String
  }

  connect() {
    this.clicked = false
  }

  confirm(event) {
    if (!this.clicked) {
      event.preventDefault()

      const title = this.titleValue
      this.send("connect", {title}, () => {
        this.clicked = true
        this.element.click()
      })
    }
  }
}
