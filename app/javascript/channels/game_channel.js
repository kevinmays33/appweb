// app/javascript/channels/game_channel.js
import consumer from "consumer"
console.log("GAME CHANNEL");
// consumer.subscriptions.create({ channel: "GameChannel", room: document.getElementById("game") }, {
//   received(data) {
//     this.appendLine(data)
//   },

//   appendLine(data) {
//     const html = this.createLine(data)
//     const element = document.querySelector("[data-chat-room='Best Room']")
//     element.insertAdjacentHTML("beforeend", html)
//   },

//   createLine(data) {
//     return `
//       <article class="chat-line">
//         <span class="speaker">${data["sent_by"]}</span>
//         <span class="body">${data["body"]}</span>
//       </article>
//     `
//   }
// })
