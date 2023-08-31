class Api::ShowsController < ApplicationController
  def index
    if params[:filters].present? && params[:filters].length > 0
      shows = Show.order("created_time DESC").reverse
      shows = shows.select { |show| show[:tags].any?{|tag| params[:filters].split(",").any? { |filter| filter.in?(tag["name"].downcase) } } }
      count = shows.length
    else
      shows = Show.order("created_time DESC").limit(params[:limit]).offset(params[:offset]).reverse
      count = Show.count
    end

    render json: { count: count, shows: shows }
  end
end