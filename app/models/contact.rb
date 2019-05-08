class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :comments, presence: true
end
