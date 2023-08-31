class Api::SearchController < ApplicationController
  def index
    if params[:q].length > 0
      result = Show.search(params[:q]).order("created_time DESC").limit(params[:limit]).offset(params[:offset]).reverse
    else
      result = Show.all
    end

    count = result.length

    render json: { count: count, shows: result }
  end
end