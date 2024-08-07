# frozen_string_literal: true

class Api::V1::MailService::EmailsController < Api::V1::BaseController
  include EmailHelper

  def categorize
    user = User.find(params[:user_id])

    categorized_emails = user.emails.where.not(category: %i[archieved deleted]).catedorized_emails

    render json: format_emails(categorized_emails, :json)
  end
end
