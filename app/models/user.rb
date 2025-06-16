class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :habits, dependent: :destroy

  # Add if you generated jti field
  before_create :generate_jti

  def generate_jti
    self.jti ||= SecureRandom.uuid
  end
end
