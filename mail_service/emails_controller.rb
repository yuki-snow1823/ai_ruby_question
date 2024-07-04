class Api::V1::MailService::EmailsController < Api::V1::BaseController
  def categorize
    user = User.find(params[:user_id])
    emails = user.emails.where.not(category: %i[archieved draft])

    
  end
end