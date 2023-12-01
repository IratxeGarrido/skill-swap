import { Controller } from "@hotwired/stimulus"
import Hammer from "hammerjs"

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["swipeCard"]

  connect() {
    // console.log(this.swipeCardTarget)

    this.swipeCardTargets.forEach((card) => {
      const hammertime = new Hammer(card);

      hammertime.get('pan').set({ direction: Hammer.DIRECTION_ALL });
      hammertime.get('pinch').set({ enable: true });

      hammertime.on('pan', (event) => {
        card.classList.add('moving')
        card.style.transform = "translate(" + event.deltaX + "px, " + event.deltaY + "px)";
        // if (event.deltaX === 0) return;
        // if (event.center.x === 0 && event.center.y === 0) return;
        totalProfile.classList.toggle('tinder_love', event.deltaX > 0);

        // console.log(event);

      })

      hammertime.on('panend', (event) => {
        card.classList.remove('moving')
        card.style.transform = '';
        console.log(event.deltaX);
        // if (event.deltaX > 80) {
        // } elsif (event.deltaX < 80 )
      })

    });
  }
}
