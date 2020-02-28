class GroceryListsController < ApplicationController 

    get '/grocery_lists/index' do 
        redirect_to_login 
        @grocery_lists = GroceryList.all 
        erb :'grocery_lists/index' 
    end 

    get '/grocery_lists/new' do
        erb :'grocery_lists/new'
    end

    post '/grocery_lists' do
        redirect_to_login
        if params[:content] != ""
            @grocery_list = GroceryList.create(content: params[:content], user_id: current_user.id)
            redirect "/users/#{current_user.id}"
        else
            redirect "/grocery_lists/new"
        end
    end 

    get '/grocery_lists/:id/edit' do  
        set_grocery_list
        redirect_to_login 
        if @grocery_list.user == current_user 
            erb:'grocery_lists/edit'
        else
            redirect "users/#{current_user.id}" 
        end 
    end  

    post '/grocery_lists/:id/edit' do
        set_grocery_list
        redirect_to_login
            if @grocery_list.user == current_user
                @grocery_list.content = params[:content]
                @grocery_list.save
                redirect "users/#{current_user.id}"
            else
                redirect "users/#{current_user.id}"
            end 
    end 

    post '/grocery_lists/:id/delete' do
        set_grocery_list
        redirect_to_login
            if @grocery_list.user == current_user
                @grocery_list.destroy 
                redirect "users/#{current_user.id}"
            else
                redirect '/login'
            end 
     end

    private

    def set_grocery_list
        @grocery_list = GroceryList.find(params[:id]) 
    end 

    def redirect_to_login
        if !logged_in? 
            redirect '/'
        end 
    end
end 