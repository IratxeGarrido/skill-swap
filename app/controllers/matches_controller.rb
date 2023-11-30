class MatchesController < ApplicationController
  def index
    @accepted_matches = Match.where(
      status: 'accepted'
    ).where(
      'creator_id = ? OR initiator_id = ?',
      current_user.profile.id,
      current_user.profile.id
    )
  end

  # Matching algorithm

  # Check if the user I'm swiping on has already initiated a match with me
  # if profile.id (user I am swiping on) is in match.initiator_id AND match.status = 'pending' AND match.creator_id = current_user
  #   if i swipe right then match.creator_id = current_user AND match.status = 'accepted'
  #   else I swipe left then match.creator_id = current_user AND match.status = 'rejected'

  # else profile.id (user I am swiping on) is NOT in match array match.initiator_id is empty
  #   if I swipe right then match.initiator_id = current_user AND match.status = 'pending'
  #   else I swipe left then match.initiator_id = current_user AND match.status = 'rejected'

  def swipe_left
    if user_has_swiped.nil?
      Match.create(
        initiator_id: current_user.profile.id,
        creator_id: params[:profile],
        status: 'rejected'
      )
    else
      @match.status = 'rejected'
      @match.save!
    end
  end

  def swipe_right
    if user_has_swiped.nil?
      Match.create(
        initiator_id: current_user.profile.id,
        creator_id: params[:profile],
        status: 'pending'
      )
    else
      @match.status = 'accepted' unless @match.status == 'rejected'
      @match.save!
    end
  end

  private

  def user_has_swiped
    @match = Match.where(
      'initiator_id = ? AND creator_id = ?',
      params[:profile], current_user.profile.id
    ).first
  end
end
