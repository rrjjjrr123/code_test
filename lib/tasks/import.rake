require 'csv'

desc "Import Articles"
namespace :import do
  task :articles => :environment do
  	importing_articles = []
  	begin
      CSV.foreach( 'articles.csv', headers: true, encoding: "utf-8") do |row, index|
      	params = { 
      		title: row["Title"],
      		content: row["Content"],
      		published_at: row["Publishd At"],
      		author_id: get_author(row["Author"]) 
      	}
      	article_import = Article.new params
      	importing_articles << article_import
      end
      Article.import importing_articles, recursive: true, validate: false
    rescue
    end
	end
end

def get_author(author)
	User.find_or_create_by(name: author)&.id
end
