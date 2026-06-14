# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create Users
user1 = User.create!(name: "Alice", email: "alice@example.com")
user2 = User.create!(name: "Bob", email: "bob@example.com")
user3 = User.create!(name: "Charlie", email: "charlie@example.com")

# Create Posts (user1 is the creator)
post1 = Post.create!(title: "First Post", content: "Hello world!", creator: user1)
post2 = Post.create!(title: "Second Post", content: "Rails is awesome!", creator: user2)

# Create Editors (Many-to-Many relationship)
# user2 and user3 are editors of post1
PostEditor.create!(post: post1, user: user2)
PostEditor.create!(post: post1, user: user3)

# user1 is an editor of post2
PostEditor.create!(post: post2, user: user1)

puts "Seeded #{User.count} users, #{Post.count} posts, and #{PostEditor.count} editors!"