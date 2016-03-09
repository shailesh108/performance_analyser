class AdminsController < ApplicationController
	before_action :authenticate_admin!,only: :welcome
	def welcome
	end
end
