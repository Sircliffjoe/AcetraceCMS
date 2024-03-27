class CaseTaskEmailJob < ApplicationJob
  queue_as :default

  def perform(user, mycase, task)
    @user = user
    @mycase = mycase
    @task = task
    NewCaseMailer.case_task_email(@user, @mycase, @task).deliver_later
  end

  
end
