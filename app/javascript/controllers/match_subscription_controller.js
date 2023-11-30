import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="match-subscription"
export default class extends Controller {
  static values = { matchId: Number }
  static targets = ["messages"]
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "MatchesChannel", id: this.matchIdValue },
      { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data)}
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
}
