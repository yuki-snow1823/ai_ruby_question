class User < ActiveRecord::Base
  validates :username, presence: true, length: { in: 3..20 }, format: { with: /\A[a-zA-Z0-9_]+\z/ }
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s.]+\.[^@\s.]+\z/ }
  validates :password, presence: true, length: { in: 8..30 }, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,30}\z/ }
  validates :birth_date, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
end
