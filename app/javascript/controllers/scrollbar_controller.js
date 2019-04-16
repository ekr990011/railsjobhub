import { Controller } from "stimulus"
import PerfectScrollbar from 'perfect-scrollbar';

export default class extends Controller {
  static targets = ["left", "right"]

  connect() {
    const ps_left = new PerfectScrollbar(this.leftTarget, {
      minScrollbarLength: 60
    });
    const ps_right = new PerfectScrollbar(this.rightTarget, {
      minScrollbarLength: 60
    });

    // Have the first job as the selected job on load
    this.leftTarget.getElementsByClassName('job')[0].id = "job_selected"
    this.leftTarget.getElementsByClassName('job')[0].classList.add('job__visited')
  }

  scrollBottom() {
    let button = document.getElementsByClassName('load__button')[0]
    if (button) {
      button.parentElement.click()
      console.log('hi')
    }
  }
}
