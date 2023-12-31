class MessagesController < ApplicationController
##############################################################################

#############################################################################
  def create
    @match = Match.find(params[:match_id])
    @message = Message.new(message_params)
    @message.match = @match
    @message.sender_id = current_user.id  #|| params[:user_id]

    if @message.save
      MatchesChannel.broadcast_to(
        @match,
        message: render_to_string(partial: "message", locals: {message: @message}),
        sender_id: @message.sender.id
      )
      head :ok
    else
      render "matches/show"
    end
  end

  def pop_up_message
    @match = Match.find(params[:match_id])
    @message = Message.new(message_params)
    @message.match = @match
    @message.sender_id = current_user.id#||params[:user_id]
    @message.save!
  end

  private

  def message_params
    params.require(:message).permit(:match_id, :content)
  end
end
