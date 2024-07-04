# frozen_string_literal: true

module EmailHelper
  def format_emails(emails)
    emails.map do |category, category_emails|
      {
        category:,
        count: category_emails.count,
        emails: category_emails.map { |email| { id: email.id, subject: email.subject } }
      }
    end
  end
end
