class GroceryListsController < ApplicationController 

    get '/grocery_lists/new' do

        erb :'grocery_lists/new'
    end

    post '/grocery_lists/new' do
        params[:user_id] = session[:user_id]
        @grocery_list = GroceryList.new(params) 
        @grocery_list.save 
        redirect '/'
    end
   
end 