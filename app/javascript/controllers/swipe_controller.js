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

      hammertime.get('pan').set({ direction: Hammer.DIRECTION_HORIZONTAL });
      hammertime.get('pinch').set({ enable: false });

      hammertime.on('pan', (event) => {
        card.classList.add('moving')
        // card.style.transform = "translate(" + event.deltaX + "px)";
        card.style.transform = "translate(" + event.deltaX + "px, 0)";
        if (event.deltaX === 0) {

          this.likeTarget.classList.add('gone');
          this.nopeTarget.classList.add('gone');
        } else if (event.deltaX > 80 ) {
          this.likeTarget.classList.remove('gone');
          this.nopeTarget.classList.add('gone');
        } else if (event.deltaX < -80 ) {
          this.nopeTarget.classList.remove('gone');
          this.likeTarget.classList.add('gone');
        }
      })

      hammertime.on('panend', (event) => {
        card.classList.remove('moving')
        this.likeTarget.classList.add('gone');
        this.nopeTarget.classList.add('gone');
        card.style.transform = '';
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
    const visibleCard = this.swipeCardTargets.filter((card) => {
      return card.classList.contains("d-none")
    })

    const index = visibleCard.length - 1

    fetch(this.likeFormTarget.action, {
        method: "POST",
        headers: {"Accept": "application/json"},
        body: new FormData(this.likeFormTargets[index])
      }).then(response => response.json())
        .then(async (data) => {
          // console.log(data)
        if (data.status === "accepted") {
          // console.log(data)
          const { value: text } = await Swal.fire({
            title: "It's a match! 🎉",
            html: `Write a message to <b>${data.profile}</b>`,
            // icon: "success",
            input: "text",
            showCloseButton: true,
            confirmButtonText: "Send",
            confirmButtonColor: "#32573C"
          });
          if (text){
            Swal.fire({text: "Message sent!", icon: "success", showCloseButton: true, showConfirmButton: false});
            this.#sendMsg(text, data)
          }
        }
      })
  }


  #sendMsg(text, data){
    const csrf = document.querySelector('meta[name=csrf-token]').content
    const requestBody = JSON.stringify( {match_id: data.match_id, content: text})

    fetch(`/pop_up_message`, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": csrf,
        "Content-Type": "application/json"
    },
      body: requestBody
    })
    .then(response => {
      response.json
    })
    .then(data => {
      // console.log(data,"something fun")
    })
  }

  #swipeLeft() {
    fetch(this.dislikeFormTarget.action, {
        method: "POST",
        headers: {"Accept": "application/json"},
        body: new FormData(this.dislikeFormTarget )
      }
    )
  }
}
