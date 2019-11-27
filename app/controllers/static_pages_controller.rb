class StaticPagesController < ApplicationController
  def home
    @recent_res = Restaurant.has_deadline.recent.limit(6)
    @best_res = Restaurant.has_deadline.best.limit(6)
  end
  def about
  end
  def contact
  end
end
