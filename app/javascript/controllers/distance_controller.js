import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="distance"
export default class extends Controller {

static targets = ["rangeSlider", "kilometer"]

  connect() {
    console.log(this.rangeSliderTarget, this.kilometerTarget)
  }

  updateValue(event) {
    this.kilometerTarget.innerText = `${event.currentTarget.value} km`

  }
}
