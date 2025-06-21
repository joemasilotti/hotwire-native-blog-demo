import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "tab-bar"

  connect() {
    const showAttribute = this.bridgeElement.bridgeAttribute("show")

    if (showAttribute == "true") {
      this.send("show")
    } else {
      this.send("hide")
    }
  }
}
