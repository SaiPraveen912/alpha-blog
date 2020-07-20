class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }, 
                                  length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i   # Validation of email using regular expression defined with a constant.
  validates :email, presence: true, uniqueness: { case_sensitive: false }, 
                                  length: { maximum: 105 }, 
                                  format: { with: VALID_EMAIL_REGEX }
end