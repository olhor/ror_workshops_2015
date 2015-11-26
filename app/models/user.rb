class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :rememberable

  validates :email, format: { with: Devise::email_regexp }
  validates :password, presence: true
end
