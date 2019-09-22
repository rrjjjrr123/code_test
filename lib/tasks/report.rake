require 'csv'

desc "Create an author report"
namespace :report do
  task :authors => :environment do
    # Your query here
    sql_query = <<-SQL
    SELECT count(*) from Articles
    SQL
    user = User.find_by(name: "Clara Oswald")
    user_date = user.created_at.strftime("%Y-%m-%d")

    data = ActiveRecord::Base.connection.execute(sql_query)
  
    total_published = <<-SQL
    SELECT COUNT(*) FROM "articles" WHERE "articles"."author_id" = 2 AND "articles"."published_at" IS NOT NULL
    SQL

    published_data = ActiveRecord::Base.connection.execute(total_published)
    published_count = published_data.values.flatten.last

    total_drafts = <<-SQL
    SELECT COUNT(*) FROM "articles" WHERE "articles"."author_id" = 2 AND "articles"."published_at" IS NULL
    SQL

    draft_data = ActiveRecord::Base.connection.execute(total_drafts)
    draft_count = draft_data.values.flatten.last    

    CSV.open('report.csv', "w") do |csv|
      csv << ["Author", "Day", "Total Drafts", "Total Published"];
      csv << [user.name, user_date, draft_count, published_count]
    end
  end
end
