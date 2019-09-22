class ArticlesController < ApplicationController
  include Pagy::Backend

  def index
    @articles = Article.where("created_at >= ?", Time.now - 7.days)
    @articles = @articles.where("title LIKE ?", "%#{params[:title]}%") unless params[:title].blank?
    @articles = @articles.where(author_id: author_id) unless params[:author_id].blank?
    @articles = @articles.published if params[:status] == "published"
    @articles = @articles.draft if params[:status] == "draft"

    @articles = @articles.includes(:author)
    @pagy, @articles = pagy(@articles)
  end
end
