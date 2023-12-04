import { Controller } from "@hotwired/stimulus"
import Hammer from "hammerjs"
import Swal from "sweetalert2"

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["swipeCard", "button", "likeForm", "dislikeForm"]
  static values = {
    profile: Number
  }

  connect() {

    this.swipeCardTargets.forEach((card) => {
      const hammertime = new Hammer(card);

      hammertime.get('pan').set({ direction: Hammer.DIRECTION_ALL });
      hammertime.get('pinch').set({ enable: true });

      hammertime.on('pan', (event) => {
        card.classList.add('moving')
        card.style.transform = "translate(" + event.deltaX + "px, " + event.deltaY + "px)";
      })

      hammertime.on('panend', (event) => {
        card.classList.remove('moving')
        card.style.transform = '';
        console.log(event.deltaX);
        if ( event.deltaX > 200) {
          card.classList.add("hide");
          this.#swipeRight()

        } else if ( event.deltaX < -200) {
          card.classList.add("hide");
          this.#swipeLeft()
        }
      })

    });
  }

  #swipeRight() {
    // event.preventDefault();
    console.log(this.likeFormTarget.action)
    fetch(this.likeFormTarget.action, {
        method: "POST",
        headers: {"Accept": "application/json"},
        body: new FormData(this.likeFormTarget)
      }).then(response => response.json())
        .then((data) => {
        if (data.status === "matched") {
          Swal.fire({
            title: "It's a match!",
            text: `Write a message to ${data.profile}`,
            icon: "success"
          });
        }
      })
  }
  #swipeLeft() {
    // event.preventDefault();
    console.log(this.dislikeFormTarget.action)
    fetch(this.dislikeFormTarget.action, {
        method: "POST",
        headers: {"Accept": "application/json"},
        body: new FormData(this.dislikeFormTarget)
      }
    )
  }
}
