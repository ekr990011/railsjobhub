import { Controller } from "stimulus"
import PerfectScrollbar from 'perfect-scrollbar';

export default class extends Controller {
  static targets = ["left", "right"]

  connect() {
    // console.log('hi')
    console.log(this.rightTarget)
    const ps_left = new PerfectScrollbar(this.leftTarget, {
      minScrollbarLength: 60
    });
    const ps_right = new PerfectScrollbar(this.rightTarget, {
      minScrollbarLength: 60
    });
  }
}
