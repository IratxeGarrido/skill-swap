class MatchesController < ApplicationController

  def index
    @accepted_matches =  Match.where(status: "accepted").where("creator_id = ? OR initiator_id = ?", current_user, current_user)
  end

  # Matching algorithm

  # Check if the user I'm swiping on has already initiated a match with me
  # if profile.id (user I am swiping on) is in match.initiator_id AND NOT match.status = "rejected"
  #   if i swipe right then match.creator_id = current_user AND match.status = "accepted"
  #   else I swipe left then match.creator_id = current_user AND match.status = "rejected"

  # else profile.id (user I am swiping on) is NOT in match array match.initiator_id is empty
  #   if I swipe right then match.initiator_id = current_user AND match.status = "pending"
  #   else I swipe left then match.initiator_id = current_user AND match.status = "rejected"

  def user_matches

  end

  def initiator?
    @accepted_matches =  Match.where(initiator_id: )
  end

end
