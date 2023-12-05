class MessagesController < ApplicationController
##############################################################################

#############################################################################
  def create
    @match = Match.find(params[:match_id])
    @message = Message.new(message_params)
    @message.match = @match
    @message.sender_id = current_user.id # how to make this part work?

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

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
