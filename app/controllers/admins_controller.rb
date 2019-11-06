class AdminsController < ApplicationController
    def home
        @all_res = Restaurant.all.asc
        @restaurant = Restaurant.new
    end
end
