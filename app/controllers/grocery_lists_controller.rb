class GroceryListsController < ApplicationController 

    get '/grocery_lists/new' do # renders a form to create a list
        erb :'grocery_lists/new'
    end

    post '/grocery_lists' do # creates the new list 
        if !logged_in? 
            redirect'/' 
        end 
    # only save if it has content
        if params[:content] != ""
            # create a new list
            @grocery_list = GroceryList.create(content: params[:content], user_id: current_user.id)
            redirect "grocery_lists/#{@grocery_list.id}"
        else
            redirect "/grocery_lists/new"
        end
    end 

    get '/grocery_lists/:id' do # show route for new list
        @grocery_list = GroceryList.find(params[:id])
        erb :'grocery_lists/show'
    end

    get '/grocery_lists/:id/edit' do
        erb :'grocery_lists/edit'
    end

end 