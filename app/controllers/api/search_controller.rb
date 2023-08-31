class Api::SearchController < ApplicationController
  def index
    if params[:q].length > 0
      shows1 = Show.search(params[:q]).order("created_time DESC").limit(params[:limit]).offset(params[:offset]).reverse
      shows2 = Show.select { |show| show[:tags].any?{|tag| tag["name"].downcase.include? params[:q] } }

      shows = (shows1 + shows2).uniq

      count = shows.length
      shows = shows.slice(params[:offset].to_i, params[:limit].to_i)
    else
      shows = Show.all
    end

    count = shows.length

    render json: { count: count, shows: shows }
  end
end