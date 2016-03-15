class AdminsController < ApplicationController
	before_action :authenticate_admin!,only: :welcome
	def welcome
	 redirect_to list_teachers_path	
	end
end
