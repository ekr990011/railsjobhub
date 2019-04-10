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
    console.log(event)

    if(document.getElementById('job_selected')) {
      document.getElementById('job_selected').id = ""
    }

    event.target.children[0].id ='job_selected'
    event.target.children[0].classList.add("job__visited")
  }

  jobAjax(event) {
    let [data, status, xhr] = event.detail
    let response = xhr.response
    document.getElementById("job_description").innerHTML = response
  }

  jobAjaxFail(event) {
    let [data, status, xhr] = event.detail
    let response = xhr.response
    console.log(response)
  }
}
