class StaticPagesController < ApplicationController
before_action :in_check
def in_check
  if current_user.admin? || current_user.adminassistant? || current_user.client? || current_user.attorney?
    if current_user.lawfirm
    if current_user.lawfirm.status == "inactive" ||  current_user.lawfirm.status == nil
         redirect_to new_transaction_path, notice: 'Your Lawfirm Subscription has Expire Contact your Lawfirm Admin!'
      end
      else
        redirect_to new_lawfirm_path, notice: 'Setup Your Lawfirm First'

end
  end

 end
def payment_history
  if current_user.admin? 
    if current_user.lawfirm.transactions
    @ress = current_user.lawfirm.transactions
  end
end

end


  def home
    if current_user.admin?
      if current_user.lawfirm == nil
       
        redirect_to new_lawfirm_path, notice: 'Admin Account was succesfully created. You have to set up your Lawfirm'
      end
      end
      @usersalls=User.all
      @user=current_user
      @mycases = Mycase.all
  @lawfirms = Lawfirm.all
  @admins = Admin.all
    lawfirmusers
   if current_user.admin? || current_user.attorney? || current_user.client?
    
    @user_cases ||= []
    if current_user.mycases.any?
       current_user.mycases.each do |u| 
        if u.client_id == current_user.id 
     @user_cases << u
      end
    end
  end
    end

    if current_user.admin?
         if current_user.lawfirm.transactions.any?
              rem = (current_user.lawfirm.transactions.last.expires_on - Date.today).to_s.split('/')
              @offset = rem[0].to_i

          end

    end


  if current_user.sadmin?
      paystackObj = Paystack.new(ENV['PUBLIC_KEY'], ENV['SECRET_KEY'])
      transactions = PaystackTransactions.new(paystackObj)
      @total = transactions.totals()
      @actives = Lawfirm.where(status: 1)
      @ats = Attorney.all
      @cls = Client.all
  end
end

    def subscribers
      @lawfirms = Lawfirm.where(status: 1).all.paginate(page: params[:page], per_page: 5)
    end

      def lawfirmusers
         if current_user.admin? || current_user.adminassistant? || current_user.client? || current_user.attorney?
     if current_user.lawfirm
          if current_user.attorney? || current_user.client?
            if current_user.mycases.any?

                  @aopen = current_user.mycases.where(status: 0).count
                  @ainview = current_user.mycases.where(status: 1).count
                  @acompleted = current_user.mycases.where(status: 2).count

                  @copen = current_user.mycases.where(status: 0).count
                  @cinview = current_user.mycases.where(status: 1).count
                  @ccompleted = current_user.mycases.where(status: 2).count

            else
                  @aopen = 0
                  @ainview = 0
                  @acompleted = 0

                   @copen = 0
                  @cinview = 0
                  @ccompleted = 0
            end
          end
    if current_user.lawfirm.mycases || current_user.lawfirm.clients || current_user.lawfirm.attorneys|| current_user.lawfirm.adminassistants
     @lawfirm_users ||= []
      @lawfirm_cases = current_user.lawfirm.mycases
     
      @lopen = current_user.lawfirm.mycases.where(status: 0)
      @linview = current_user.lawfirm.mycases.where(status: 1)
      @lcompleted = current_user.lawfirm.mycases.where(status: 2)
      

      
      
  
      @clients = current_user.lawfirm.clients
      
       @lawfirm_adminassistant = current_user.lawfirm.adminassistants
       @lawfirm_attorneys= current_user.lawfirm.attorneys
    
 @lawfirm_adminassistant.each do |u| 
     @lawfirm_users << u
    
    end

    @lawfirm_attorneys.each do |u| 
     @lawfirm_users << u
    
    end

    @clients.each do |u| 
     @lawfirm_users << u
    
    end

    @lawfirm_users << current_user

      end
    end
  end
  end
  def lawfirmcases
    home
  end

   def clawfirmcases
    home
  end

  def assignattorney
    home
  end



   def attorneycases
    home
  end

  def attorneycases
    home
  end

  def attorneycasesdis
    home
  end

   def clientcasesdis
    home
  end

     def clientcases
    home
  end



  def clients
    lawfirmusers  
end

  def admins
    home 
end



def attorneys
  lawfirmusers
  
 end


 def cattorneys
 lawfirmusers
 @com_attorneys ||= [] 
 @lawfirm_attorneys.each do |u|

  if u.mycases.any?
    u.mycases.each do |c|

      if c.status == "completed"
        @com_attorneys << u
      end and return
    end
  end
 end
 end


end

