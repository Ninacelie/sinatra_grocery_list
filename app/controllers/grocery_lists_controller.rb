class GroceryListsController < ApplicationController 

    get '/grocery_lists/new' do # renders a form to create a list
        erb :'grocery_lists/new'
    end

    post '/grocery_lists' do # creates the new list 
        if !logged_in? 
            redirect'/' 
        end # only save if it has content
        if params[:content] != ""
            # create a new list
            @grocery_list = GroceryList.create(content: params[:content], user_id: current_user.id)
            redirect "/users/#{current_user.id}"
        else
            redirect "/grocery_lists/new"
        end
    end 

    get '/grocery_lists/:id/edit' do # this route sends us to edit.erb 
        set_grocery_list
        if logged_in? # but only if user is currently logged in
            if @grocery_list.user == current_user 
                erb:'grocery_lists/edit' # renders edit form 
            else
                redirect "users/#{current_user.id}" # go back to users home page
            end 
        else 
            redirect '/'
        end 
    end  

    post '/grocery_lists/:id/edit' do # edits and saves the list 
        set_grocery_list
        if logged_in? 
            if @grocery_list.user == current_user
                @grocery_list.content = params[:content]
                @grocery_list.save
                # user_id = session[:user_id]
                redirect "users/#{current_user.id}"
            else
                redirect "users/#{current_user.id}"
            end 
        end 
    end 

    post '/grocery_lists/:id/delete' do
        set_grocery_list
        if logged_in? 
            if @grocery_list.user == current_user
                @grocery_list.destroy 
                redirect "users/#{current_user.id}"
            else
                redirect '/login'
            end 
        end 
     end

    private

    def set_grocery_list # used multiple time so defined special method 
        @grocery_list = GroceryList.find(params[:id]) 
    end 
end 