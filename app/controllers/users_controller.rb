class UsersController < ApplicationController
# gives this class access to everything in applicationcontroller inherits

# create login route, to show them the login page (render login form)
    get '/login' do
        erb :login 
    end


# post is a sinatra method, to recieve the login form, find the user and log the user in (create a session)
    post '/login' do #findby finds key value pair
        # find user
        # authenticate user 
        @user = user.find_by(email: params[:email])
        if @user.authenticate(params[:password]) 
        # log that user in
        # redirect to users landing page 
        # create users session 
        else 
        # tell user invalid credentials
        # redirect to login page
        end 

    end


# create signup
    get '/signup' do
    
    end

end 