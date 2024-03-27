
namespace :recurring do
desc 'Deactivate Over due Lawfirms!'
  task init: :environment do
    Recharge.schedule!
  end
end