class ScheduleController < ApplicationController



  before_filter :set_temporary_attributes



  def index
    yesterday = Date.yesterday.to_time.to_i
    nextweek = (Date.today + 7).to_time.to_i
    @schedule = Schedule::Grabber.get_events({from: yesterday, to: nextweek, groups: @group.code})
  end

  def show
    schedule_for = params[:period] || ''
    case schedule_for
      when 'today'
        to = (Date.today + 1).to_time.to_i
      when 'week'
        to = (Date.today + 7).to_time.to_i
      when 'month'
        to = (Date.today + 30).to_time.to_i
      when 'semester'
        from = Date.new(2012,9,1).to_time.to_i
        to = Date.new(2013,1,31).to_time.to_i
      else
        redirect_to action: :index
        return
    end
    from = Date.today.to_time.to_i unless from.present?
    @schedule = Schedule::Grabber.get_events({from: from, to: to, groups: @group.code})

    render layout: false if request.xhr?
  end



  private



    def set_temporary_attributes
      @group = Group.find_by_name("4001BN")
    end



end