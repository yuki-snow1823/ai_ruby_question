# frozen_string_literal: true

class Email < ApplicationRecord
  belongs_to :user

  enum status: { active: 0, archived: 1, deleted: 2 }
  enum category: { inbox: 0, sent: 1, draft: 2 }

  scope :latest, ->(limit) { order(created_at: :desc).limit(limit) }

  def self.format_emails(emails, ext)
    case ext
    when :json
      emails.map do |category, emails|
        {
          category:,
          count: emails.count,
          emails: emails.map { |email| { id: email.id, subject: email.subject } }
        }
      end
    end
  end
end
