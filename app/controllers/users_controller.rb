class UsersController < ApplicationController
# gives this class access to everything in applicationcontroller inherits

# create login route, to show them the login page (render login form)
    get '/login' do
        redirect_if_logged_in
        erb :login 
    end

# post is a sinatra method, to recieve the login form, 
# find the user and log the user in (create a session)
    post '/login' do #findby finds key value pair
        # find user
        # authenticate user 
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password]) 
        # log that user in
        # create users session 
            session[:user_id] = @user.id # actually logging in
        # then redirect to user's show page
            # flash[:message] = "Welcome, #{@user.name}!"
            redirect "users/#{@user.id}"
        else 
        # tell user invalid credentials
            # flash[:error] = "Your credentials were invalid. Please sign up or try again."
        # redirect to login page
            redirect '/login'
        end 
    end

# create signup, renders signup form
    get '/signup' do
        redirect_if_logged_in
        erb :signup 
    end

    post '/users' do
    # create a new user here and add to db
    # user must have name, email, and password
        @user = User.new(params) 
    # now have ActiveRecord validations within User model class vs
    # just checking params keys to have values 
        if @user.save
            session[:user_id] = @user.id 
    # go to user show page 
            # flash[:message] = "You have successfully created an account, #{@user.name}! Welcome!"
            redirect "/users/#{@user.id}"
        else
    # not valid input tell user not valid
            # flash[:error] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
            redirect '/signup'
        end 
    end

    # user SHOW route
    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        #redirect_if_logged_in

        erb :'users/show'
    end

    post '/logout' do
        session.clear
        redirect '/'
    end

end 