class UsersController < ApplicationController
    # inherits all methods from AC
    
    get '/login' do # renders / shows login form
        erb :login 
    end

    post '/login' do 
        # find user
        # authenticate user + log them in, post receives form
        @user = User.find_by(email: params[:email]) 
        if @user == nil 
            redirect '/login' 
        end  
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

    
    get '/signup' do # create signup, renders signup form
        erb :signup # renders a view, signup bc not nested, can do just signup
    end

    post '/users' do
    # create a new user here and add to db
    # user must have name, email, and password
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            if User.find_by(email: params[:email]) == nil # if nil user exists
                @user = User.create(params)
                session[:user_id] = @user.id # logging user in 
                # go to user show page 
                redirect "/users/#{@user.id}" # interpolate bc its a string
            else
                redirect '/' # redirect if email already exists
            end 
            # redirect not render bc need to go to new route 
        else
            # not valid input tell user not valid
            redirect '/signup'
        end 
    end

    # user SHOW route
    get '/users/:id' do # :id is dynamic, it can change 
        @user = User.find_by(id: params[:id])
        if @user == current_user # user can only view their show page 
        #redirect_if_logged_in
            erb :'users/show'
        else
            redirect '/'
        end 
    end

    post '/logout' do
        session.clear
        redirect '/'
    end

end 