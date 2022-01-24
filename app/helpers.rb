module Helpers
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def time_and_date(time)
    time.strftime('at %H:%M on %d-%m-%Y')
  end
end
