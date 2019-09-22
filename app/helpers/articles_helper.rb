module ArticlesHelper
  include Pagy::Frontend
  
  def recent_authors(articles)
  	articles.collect {|article| article.author.name }.uniq.join(", ")
  end

  def article_status(article)
  	published_at = article.published_at
  	(published_at.nil? || published_at > Time.now) ? "draft" : "published"
  end
end
