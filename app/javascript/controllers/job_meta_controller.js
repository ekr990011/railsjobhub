import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.element.firstElementChild.setAttribute('data-action',
        'ajax:success->job-meta#addJobs' + ' ajax:error->job-meta#addJobsFail'
         + ' ajax:before->job-meta#addJobsBefore')
  }

  addJobs(event) {
    let [data, status, xhr] = event.detail
    let response = xhr.response
    if (response.length === 0 || response.length === 3) {
      event.target.parentElement.innerHTML = "<span>No More To Load!</span>"
    } else {
      // Insert new job results
      let load_button = event.target.parentElement
      load_button.insertAdjacentHTML('beforebegin', response)

      // Increment pagination page count
      let form_input = event.target.children[1]
      let form_page = parseInt(form_input.getAttribute("value"))
      form_page = (form_page + 1)
      form_input.setAttribute("value", form_page)
    }
  }

  addJobsBefore(event) {

  }

  addJobsFail() {
    console.log("error")
  }

}
