import { Controller } from "stimulus"
import SimpleBar from "simplebar"

export default class extends Controller {
  // static targets = [ "description" ]

  connect() {
    // console.log(this.data.get("info"))
    // console.log(document.getElementById('job__scrollbar'))
    // new SimpleBar(document.getElementById('job__scrollbar'))
    // this.outputTarget.textContent = 'Hello, Stimulus!'
  }

  jobClick(event) {
    let [data, status, xhr] = event.detail;
    let response = xhr.response
    document.getElementById("job_description").innerHTML = response
  }

  jobClickFail(event) {
    let [data, status, xhr] = event.detail;
    let response = xhr.response
    console.log(response)
  }
}
