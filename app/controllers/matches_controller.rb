require "pry"

class MatchesController < ApplicationController
  def index
    @accepted_matches =  Match.where(status: "accepted").where("creator_id = ? OR initiator_id = ?", current_user, current_user)
    # Match.where(initiator_id: profile_id)
  end

  def create
    @form_type = params[:match][:form]
    @profile_id = params[:match][:profile]
    @form_type == "like" ? swipe_right(@profile_id) : swipe_left(@profile_id)
  end

  def swipe_left(profile_id)
    if user_has_swiped.nil?
      Match.create(
        initiator_id: current_user.profile.id,
        creator_id: profile_id,
        status: 'rejected'
      )
    else
      @match.status = 'rejected'
      @match.save!
    end
  end

  def swipe_right(profile_id)
    if user_has_swiped.nil?
      Match.create(
        initiator_id: current_user.profile.id,
        creator_id: profile_id,
        status: 'pending'
      )
    else
      @match.status = 'accepted' unless @match.status == 'rejected'
      @match.save!
    end
  end

  def user_matches
    Match.where(initiator_id: @test_profile.user_id)

  end


end
