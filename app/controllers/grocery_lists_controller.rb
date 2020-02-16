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

    get '/grocery_lists/:id/edit' do
        if !logged_in?
            redirect '/login'
        else
            @grocery_list = GroceryList.find(params[:user_id])
            if current_user.id == @grocery_list.user_id 
                erb :'grocery_lists/edit'
            else
                redirect '/login'
            end 
        end 
    end 

    patch '/grocery_lists/:id' do
        redirect_if_not_logged_in
        # 1. find the grocery list
        set_grocery_list
        if @grocery_list.user == current_user && params[:content] != ""
        # 2. modify (update) the grocery list
          @grocery_list.update(content: params[:content])
          # 3. redirect to show page
          redirect "/grocery_lists/#{@grocery_list.id}"
        else
          redirect "users/#{current_user.id}"
        end
      end
   
    private

    def set_grocery_list
      @grocery_list = GroceryList.find(params[:id])
    end

end 