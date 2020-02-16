class GroceryList < ActiveRecord::Base

    belongs_to :user 

    #validates :list, presence: true 
    
end
