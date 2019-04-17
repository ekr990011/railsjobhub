import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
  }

  changeDescription(event) {
    document.getElementById('job_description').innerHTML = event.target.value
  }
}
