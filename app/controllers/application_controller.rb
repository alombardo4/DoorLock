class ApplicationController < ActionController::Base
  before_filter :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	def is_locked
  		# pin = PiPiper::Pin.new(:pin => 11, :direction => :in, :pull => :down)
  		# return pin.value
      Rails.application.config.global_lock
  	end

  	def is_closed
  		# pin = PiPiper::Pin.new(:pin => 13, :direction => :in, :pull => :up)
  		# return pin.value
      true
  	end

    def turn_lock(will_lock)
      if will_lock == true
        #lock the lock
        Rails.application.config.global_lock = true
      else
        #unlock the lock
        Rails.application.config.global_lock = false
      end
    end

  	protected
		def authorize
			unless User.find_by_id(session[:user_id])
			redirect_to login_url, notice: "Please log in" end
		end

end
