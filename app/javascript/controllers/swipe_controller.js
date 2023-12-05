import { Controller } from "@hotwired/stimulus"
import Hammer from "hammerjs"
import Swal from "sweetalert2"

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["swipeCard", "button", "likeForm", "dislikeForm", "icon",
                    "like", "nope"]
  static values = {
    profile: Number
  }

  connect() {

    this.swipeCardTargets.forEach((card, index) => {
      const hammertime = new Hammer(card);

      card.style.zIndex = this.swipeCardTargets.length - index;

      hammertime.get('pan').set({ direction: Hammer.DIRECTION_ALL });
      hammertime.get('pinch').set({ enable: true });

      hammertime.on('pan', (event) => {
        card.classList.add('moving')
        card.style.transform = "translate(" + event.deltaX + "px, " + event.deltaY + "px)";
        // // helppp
        // this.iconTarget.classList.add('float-love');
        if (event.deltaX === 0) {
          this.likeTarget.classList.add('d-none');
          this.nopeTarget.classList.add('d-none');
          // console.log(`None: ${event.deltaX}`);
        } else if (event.deltaX > 80 ) {
          this.likeTarget.classList.remove('d-none');
          this.nopeTarget.classList.add('d-none');
          // console.log(`Like: ${event.deltaX}`);
        } else if (event.deltaX < -80 ) {
          this.nopeTarget.classList.remove('d-none');
          this.likeTarget.classList.add('d-none');
          // console.log(`Nope: ${event.deltaX}`);
        }

        // this.iconTarget.classList.toggle('float-love', event.deltaX > 0);
        // this.iconTarget.classList.toggle('float-no', event.deltaX < 0);
      })

      hammertime.on('panend', (event) => {
        card.classList.remove('moving')
        this.likeTarget.classList.add('d-none');
        this.nopeTarget.classList.add('d-none');
        card.style.transform = '';
        // console.log(event.deltaX);
        if ( event.deltaX > 200) {
          card.classList.add("d-none");
          this.#swipeRight()

        } else if ( event.deltaX < -200) {
          card.classList.add("d-none");
          this.#swipeLeft()
        }
      })
    });
  }

  #swipeRight() {
    // event.preventDefault();
    // console.log(this.likeFormTargets)

    const visibleCard = this.swipeCardTargets.filter((card) => {
      console.log(card.classList.contains("d-none"))
      return card.classList.contains("d-none")
    })

    const index = visibleCard.length - 1

    fetch(this.likeFormTarget.action, {
        method: "POST",
        headers: {"Accept": "application/json"},
        body: new FormData(this.likeFormTargets[index])
      }).then(response => response.json())
        .then((data) => {
        if (data.status === "matched") {
          console.log(data)
          Swal.fire({
            title: "It's a match!",
            text: `Write a message to ${data.profile}`,
            icon: "success",
            input: "text",
            showCloseButton: true,
            confirmButtonText: "Send"
          });
        }
      })
  }
  #swipeLeft() {
    // event.preventDefault();
    // console.log(this.dislikeFormTarget.action)
    fetch(this.dislikeFormTarget.action, {
        method: "POST",
        headers: {"Accept": "application/json"},
        body: new FormData(this.dislikeFormTarget)
      }
    )
  }

  // #initSweetalert() {
  //   preventDefault();
  //   Swal.fire({
  //     title: this.titleValue,
  //     text: this.textValue,
  //     icon: this.iconValue,
  //     input: this.InputValue,
  //     showCloseButton: this.showCancelButtonValue,
  //     confirmButtonText: this.confirmButtonTextValue
  //   });
  // }
}
