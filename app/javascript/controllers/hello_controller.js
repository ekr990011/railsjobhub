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
  // static targets = [ "output" ]

  connect() {
    console.log('hi from stimulus')
    // console.log(document.getElementById('job__scrollbar'))
    // new SimpleBar(document.getElementById('job__scrollbar'))
    // this.outputTarget.textContent = 'Hello, Stimulus!'
  }
}
