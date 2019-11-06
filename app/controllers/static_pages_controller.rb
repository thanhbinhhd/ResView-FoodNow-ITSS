class StaticPagesController < ApplicationController
  def home
    @recent_res = Restaurant.recent.limit(6)
    @best_res = Restaurant.best.limit(6)
  end
end
