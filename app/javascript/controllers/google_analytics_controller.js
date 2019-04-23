import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-138906419-1');
  }

}
