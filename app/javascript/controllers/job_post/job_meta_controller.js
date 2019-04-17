import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "title", "company", "location" ]

  connect() {
    console.log('hi')
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
