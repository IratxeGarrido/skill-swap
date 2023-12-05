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

  def swipe_left(profile_id)
    if user_has_swiped(profile_id).nil?
      Match.create(
        initiator_id: current_user.profile.id,
        creator_id: profile_id,
        status: 'rejected'
      )
    else
      @match.rejected!
      @match.save!
    end
  end

  def swipe_right(profile_id)
    user_has_swiped(profile_id).nil? ? handle_initial_swipe_right(profile_id) : handle_its_a_match
    @match.save!
    respond_to do |format|
      profile = Profile.find(profile_id)
      msg = { status: @match.status, profile: profile.first_name }
      format.json { render json: msg }
    end
  end

  private

  def handle_initial_swipe_right(profile_id)
    @match = Match.new(
      initiator_id: current_user.profile.id,
      creator_id: profile_id,
      status: 'pending'
    )
  end

  def handle_its_a_match
    @match.accepted! unless @match.rejected?
  end

  def user_matches
    Match.where(initiator_id: @test_profile.user_id)
  end

  def user_has_swiped(profile_id)
    @match = Match.where(
      'initiator_id = ? AND creator_id = ?',
      profile_id, current_user.profile.id
    ).first
  end
end
