require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#in order to send PATCH and DELETE requests, add a line of code here:
# use Rack:MethodOverride 

use UsersController #mount the userscontroller 
use GroceryListsController
run ApplicationController
