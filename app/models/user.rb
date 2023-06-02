class User < ApplicationRecord
  before_create :confirmation_token

  has_secure_password
  has_many :messages

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
