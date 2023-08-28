class Api::SearchController < ApplicationController
  def index
    if params[:q].length > 0
      result = Show.search(params[:q])
    else
      result = Show.all
    end
    render json: result
  end
end