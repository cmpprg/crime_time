class User < ApplicationRecord
  validates :uid, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
