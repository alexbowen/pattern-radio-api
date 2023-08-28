class Api::ShowsController < ApplicationController
  def index
    shows = Show.limit(params[:limit]).offset(params[:offset])

    if params[:filters].present? && params[:filters].length > 0
      shows = shows.select { |show| show[:tags].any?{|tag| params[:filters].split(",").any? { |filter| filter.in?(tag["name"].downcase) } } }
    end

    render json: shows
  end
end