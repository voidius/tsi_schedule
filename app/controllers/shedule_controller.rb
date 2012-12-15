class SheduleController < ApplicationController



  before_filter :set_temporarty_attributes



  def index
    yesterday = Date.yesterday.to_time.to_i
    nextweek = (Date.today + 7).to_time.to_i
    @shedule = Shedule::Grabber.get_events({from: yesterday, to: nextweek, groups: @group.code})
  end

  def show
    shedule_for = params[:id] || ''
    case shedule_for
      when 'today'
        to = (Date.today + 1).to_time.to_i
      when 'week'
        to = (Date.today + 7).to_time.to_i
      when 'month'
        to = (Date.today + 30).to_time.to_i
      else
        redirect_to action: :index
        return
    end
    from = Date.today.to_time.to_i
    @shedule = Shedule::Grabber.get_events({from: from, to: to, groups: @group.code})

    if request.xhr?
      render :show, layout: false
    end
  end



  private



    def set_temporarty_attributes
      @group = Group.find_by_name("4001BN")
    end



end