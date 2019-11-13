class AdminsController < ApplicationController
    def home
        if !admin_signed_in? 
            redirect_to new_admin_session_path
            return
        end
        @all_res = Restaurant.all.asc
        @restaurant = Restaurant.new
    end
end
