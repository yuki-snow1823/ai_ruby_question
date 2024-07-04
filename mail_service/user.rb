# frozen_string_literal: true

class User < ApplicationRecord
  has_many :emails

  def catedorized_emails(category, limit_count)
    emails.where(category:).pluck(:id, :subject).latest(limit_count)
  end
end
