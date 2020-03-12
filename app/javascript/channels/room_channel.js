import consumer from "./consumer"

const roomChannel = consumer.subscriptions.create({ channel: "RoomChannel", room: "BestRoom" }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      $('#messages').append(data['message'])
      //this.appendLine(data)
    },
  
    appendLine(data) {
      const html = this.createLine(data)
      const element = document.querySelector("[data-chat-room='Best Room']")
      element.insertAdjacentHTML('beforeend', html)
    },
  
    createLine(data) {
      return `
      <article class="chat-line">
        <span class="speaker">${data["sent_by"]}</span>
        <span class="body">${data["content"]}</span>
      </article>
      `
    }
})

roomChannel.send({ send_by: "Paul", content: "This is a cool chat app."})

let submit_messages;

$(document).on('turbolinks:load', function() {
 submit_messages()
})

submit_messages = function() {
  $('#message_content').on('keydown', function(event) {
    if (event.keyCode == 13) {
      $('input').click()
      event.target.value = ''
      event.preventDefault()
    }
  })
}
