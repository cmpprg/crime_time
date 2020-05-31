class User < ApplicationRecord
  validates :uid, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def has_state?
    state.present?
  end
end
