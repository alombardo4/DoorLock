class StatusController < ApplicationController
	before_filter :authorize
	def index
		@isLocked = is_locked
		@isClosed = is_closed
	end
end