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
        @user = user.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password]) 
        # log that user in
        # create users session 
            session[:user_id] = @user.id # actually logging in
        # then redirect to user's show page
            flash[:message] = "Welcome, #{@user.name}!"
            redirect "users/#{@user.id}"
        else 
        # tell user invalid credentials
            flash[:error] = "Your credentials were invalid. Please sign up or try again."
        # redirect to login page
            redirect '/login'
        end 
    end


# create signup, renders signup form
    get '/signup' do
        redirect_if_logged_in
        erb :signup 
    end

end 