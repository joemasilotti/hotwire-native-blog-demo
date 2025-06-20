import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "confirm"

  show(event) {
    if (event.isTrusted) {
      event.preventDefault()

      const title = this.bridgeElement.bridgeAttribute("title")
      const destructive = this.bridgeElement.bridgeAttribute("destructive") == "true"

      this.send("show", {title, destructive}, () => {
        this.bridgeElement.click()
      })
    }
  }
}
