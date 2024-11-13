class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email, with: ->(e) { e.strip.downcase }

  validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'should look like an email address.' },
    length: { maximum: 100 },
    uniqueness: { case_sensitive: false, if: :will_save_change_to_email? }

  validates :password, length: { minimum: 8 }, if: -> { password.present? }
  validates :password_confirmation, length: { minimum: 8 }, if: -> { password_confirmation.present? }
end
