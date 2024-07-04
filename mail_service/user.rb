# frozen_string_literal: true

class User < ApplicationRecord
  has_many :emails

  def catedorized_emails(category, limit_count, order_as)
    emails.where(category:).pluck(:id, :subject).latest(limit_count, order_as)
  end
end
