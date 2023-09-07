class Api::PostsController < ApplicationController
  def index
    if params[:filters].present? && params[:filters].length > 0
      shows = Show.select { |show| show[:tags].any?{|tag| params[:filters].split(",").any? { |filter| filter.in?(tag["name"].downcase) } } }
      count = shows.length
      shows = shows.slice(params[:offset].to_i, params[:limit].to_i)
    else
      posts = Post.order("published_at DESC").limit(params[:limit]).offset(params[:offset])
      count = Post.count
    end

    render json: { count: count, items: posts }
  end
end