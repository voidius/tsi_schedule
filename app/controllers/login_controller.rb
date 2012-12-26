class LoginController < ApplicationController

  def index
    redirect_to schedule_path if user_signed_in?
  end

end
