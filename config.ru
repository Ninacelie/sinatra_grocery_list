require './config/environment' # requiring the data present inside environment.rb

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#in order to send PATCH and DELETE requests, add a line of code here:
# use Rack:MethodOverride 

use UsersController #mount the controllers
use GroceryListsController
run ApplicationController
