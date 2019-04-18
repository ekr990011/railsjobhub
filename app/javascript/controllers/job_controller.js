import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
  }

  jobClick(event) {
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
    this.scrollbarController.scrollTop()
  }

  jobAjaxFail(event) {
    let [data, status, xhr] = event.detail
    let response = xhr.response
    console.log(response)
  }

  get scrollbarController() {
   return this.application.getControllerForElementAndIdentifier(
     document.getElementById('scrollbar'), "scrollbar")
 }
}
