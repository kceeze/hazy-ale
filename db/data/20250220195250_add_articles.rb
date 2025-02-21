# frozen_string_literal: true

class AddArticles < ActiveRecord::Migration[6.0]
  require 'faker'

  def up
      if Rails.env == "development"
        1.upto(100) do |n|
          Article.create(
            title: Faker::Book.title,
            content: Faker::Markdown.emphasis,
            author: Faker::Name.name,
            category: Faker::Alphanumeric,
            published_at: (Date.today - rand(50000))
          )
        end
      end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
