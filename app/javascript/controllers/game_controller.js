import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = {
    gameId: String
  }

  static targets = ["lobby"];

  gameChannel = null;

  connect() {
    console.log(this.gameIdValue);
    let consumer;
    consumer = createConsumer('http://127.0.0.1:3000/cable');
    this.gameChannel = consumer.subscriptions.create({ channel: "GameChannel", room: this.gameIdValue }, {
      received: (data) => {
        const html = this.createLine(data)
        this.lobbyTarget.insertAdjacentHTML("beforeend", html)
      }
    })
  }

  disconnect() {
    gameChannel.unsubscribe();
    gameChannel = null;
  }

  createLine(data) {
    return `
      <article class="chat-line">
        <span class="speaker">${data["sent_by"]}</span>
        <span class="body">${data["body"]}</span>
      </article>
    `
  }
}
