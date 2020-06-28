# Created a article.rb file in models section
# This model gives us setters and getteres so that we can work with individual articles data.
class Article < ApplicationRecord
    # Added validations to models->article.rb
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end