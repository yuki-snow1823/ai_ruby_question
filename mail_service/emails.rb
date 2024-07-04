# frozen_string_literal: true

class Email < ApplicationRecord
  belongs_to :user

  enum status: { active: 0, archived: 1, deleted: 2 }
  enum category: { inbox: 0, sent: 1, draft: 2 }

  scope :latest, ->(limit_count = 5, sort_order = :desc) { order(created_at: sort_order).limit(limit_count) }

  def self.format(emails, ext)
    case ext
    when :json
      emails.map do |category, emails|
        {
          category:,
          count: emails.count,
          emails:
        }
      end
    end
  end
end
