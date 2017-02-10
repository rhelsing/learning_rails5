class ChatRoomChannel < ApplicationCable::Channel

  def subscribed
     stream_from "chat_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcase("chat_room_channel", :message => data['message'])
  end
end
