import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "title", "titleFocus", "company", "location" ]

  connect() {
    this.titleFocusTarget.focus()
  }

  changeTitle(event) {
    this.titleTarget.innerText = event.target.value
  }

  changeCompany(event) {
    this.companyTarget.innerText = event.target.value
  }

  changeLocation(event) {
    this.locationTarget.innerText = event.target.value
  }
}
