import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "title", "titleFocus", "company", "location" ]

  connect() {
  }

  changeTitle(event) {
    this.titleTarget.innerText = event.target.value
    document.getElementById('title_description').innerText = event.target.value
  }

  changeCompany(event) {
    this.companyTarget.innerText = event.target.value
    document.getElementById('company_description').innerText = event.target.value + ' - '
  }

  changeLocation(event) {
    this.locationTarget.innerText = event.target.value
    document.getElementById('location_description').innerText = event.target.value
  }

}
