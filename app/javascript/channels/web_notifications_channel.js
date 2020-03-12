import consumer from "./consumer"

consumer.subscriptions.create("WebNotificationsChannel", {
  received(data) {
    // Called when there's incoming data on the websocket for this channel
    new Notification(data["title"], data["body"])
  }
});
