# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :password, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }

  # パスワード強度チェックのカスタムバリデーション
  validate :password_complexity

  private

  def password_complexity
    return if password.blank?

    return if /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$/.match?(password)

    errors.add :password, 'must include at least one uppercase letter, one lowercase letter, one digit, and one special character'
  end
end
