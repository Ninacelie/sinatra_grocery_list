# here is where I will create seed data to work and test with

nina = User.create(name: "Nina", email: "nina@nina.com", password: "password")
ophelia = User.create(name: "Ophelia", email: "ophelia@ophelia.com", password: "password")

GroceryList.create(content: "Milk, Eggs, Bread, Deli Meat", user_id: nina.id) 
GroceryList.create(content: "Orange Juice, Cheese, Pickles", user_id: ophelia.id) 

