class MatchesController < ApplicationController

  def show
    @accepted_matches = Match.where(
      status: 'accepted'
    ).where(
      'creator_id = ? OR initiator_id = ?',
      current_user.profile.id,
      current_user.profile.id
    )
    @match = Match.find(params[:id])
    @message = Message.new
  end

  def index
    @accepted_matches = Match.where(
      status: 'accepted'
    ).where(
      'creator_id = ? OR initiator_id = ?',
      current_user.profile.id,
      current_user.profile.id
    )

    @latest_messages = {}
    @accepted_matches.each do |match|
      @latest_messages[match.id] = match.messages.order(created_at: :desc).first
    end
  end

  
  def create
    @form_type = params[:match][:form]
    @profile_id = params[:match][:profile]
    @form_type == "like" ? swipe_right(@profile_id) : swipe_left(@profile_id)
  end

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

  def user_matches
    Match.where(initiator_id: @test_profile.user_id)
  end

  def user_has_swiped
    @match = Match.where(
      'initiator_id = ? AND creator_id = ?',
      params[:profile], current_user.profile.id
    ).first
  end
end
