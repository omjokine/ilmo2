class Admin::MailerController < AdminController
  
  def show
    @exercise_groups = ExerciseGroup.all
  end
 
  def create
    exercise_group = ExerciseGroup.find(params[:exercise_group_id])
  
    message_subject = params[:subject]
    message_body = params[:body]
  
    flash[:mailed_to] = []
    exercise_group.users.each do |user|
      if user.email
        UserMailer.deliver_message(user, message_subject, message_body)
        flash[:mailed_to] << user.email
      end
    end
    
    redirect_to :action => :show
  end
end
