class UserMailer < ActionMailer::Base
 
  def message(user, message_subject, message_body)
    recipients user.email
    subject message_subject
    from "ilmo2@example.com"
    body :message_body => message_body,
                :user => user
    
  end
end
