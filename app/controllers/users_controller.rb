class UsersController < ApplicationController
#gives this class access to everything in applicationcontroller

#create login route, to show them the login page (render login form)
get '/login' do
    erb :login 
end

#create signup
get '/signup' do
    
end

end 