import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="match-subscription"
export default class extends Controller {
  static values = { matchId: Number, currentUserId: Number }
  // added the currentUserId to above
  static targets = ["messages"]
  connect() {
    console.log(this.element.scrollHeight)
    this.element.scrollTo(0, this.element.scrollHeight)
    this.channel = createConsumer().subscriptions.create(
      { channel: "MatchesChannel", id: this.matchIdValue },
      { received: data => this.#insertMessageAndScrollDown(data)}
    )
    console.log(`Subscribed to the chatroom with the id ${this.matchIdValue}.`)

  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
  console.log("Unsubscribed from the chatroom")
  this.channel.unsubscribe()
  }
  ///////////////////////////////////////////////////////////////////////////
  #insertMessageAndScrollDown(data) {
    console.log(data);
    console.log(data.message);
    // Logic to know if the sender is the current_user
    const currentUserIsSender =  this.currentUserIdValue === data.sender_id
    // Creating the whole message from the `data.message` String)

    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)
    // Inserting the `message` in the DOM
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.#scrollPlease()
  }

  #scrollPlease() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight + 100)
  }
  ///////////////////////////////////////////////////////////////////////////////

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }

}
