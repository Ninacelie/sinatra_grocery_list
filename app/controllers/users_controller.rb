class UsersController < ApplicationController
    # gives this class access to everything in applicationcontroller inherits

    # create login route, to show them the login page (render login form)
    get '/login' do
        erb :login 
    end

    # post is a sinatra method, to recieve the login form, 
    # find the user and log the user in (create a session)
    post '/login' do #findby finds key value pair
        # find user
        # authenticate user 
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password]) 
        # if user is authentic, log that user in
        # create users session, session is had, :user_id is key
            session[:user_id] = @user.id # actually logging in
        # then redirect to user's show page
            redirect "users/#{@user.id}" # users show page
        else 
        # invalid credentials, redirect to login form
            redirect '/login'
        end 
    end

    # create signup, renders signup form
    get '/signup' do
        erb :signup # renders a view, signup bc not nested, can do just signup
    end

    post '/users' do
    # create a new user here and add to db
    # user must have name, email, and password
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            @user = User.create(params)
    # go to user show page 
            redirect "/users/#{@user.id}" # interpolate bc its a string
    # redirect not render bc need to go to new route 
        else
    # not valid input tell user not valid
            redirect '/signup'
        end 
    end

    # user SHOW route
    get '/users/:id' do # :id is dynamic, it can change 
        @user = User.find_by(id: params[:id])
        #redirect_if_logged_in

        erb :'users/show'
    end

    post '/logout' do
        session.clear
        redirect '/'
    end

end 