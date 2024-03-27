json.extract! mycase, :id, :caseNo, :client_name, :subject, :area_of_practice, :opponents, :assigned_attorney, :arrival_date, :due_date, :status, :summary_of_brief, :add_judge, :add_court, :user_id, :created_at, :updated_at
json.url mycase_url(mycase, format: :json)
