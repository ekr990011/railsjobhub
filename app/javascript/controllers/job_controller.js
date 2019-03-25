// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

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
    console.log('hi')
    let [data, status, xhr] = event.detail;
    // const id = this.data.get("id")
    // const model = this.data.get("model")
    console.log(xhr.response)
    // this.load(id, model)
  }

  load(id, model) {
    console.log(id, model)
    document.getElementById("job_description").innerHTML = `${model}`
  }
}
