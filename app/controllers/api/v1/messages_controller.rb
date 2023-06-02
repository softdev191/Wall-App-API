class Api::V1::MessagesController < ApplicationController

  def index
    @messages = Message.all
    json_messages = MessageSerializer.new(@messages).serialized_json
    render json: json_messages, status: :ok
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      json_message = MessageSerializer.new(@message).serialized_json
      render json: json_message, status: :created
    else
      resp = {
        error: @message.errors.full_messages
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
