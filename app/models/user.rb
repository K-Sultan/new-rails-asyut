class User < ApplicationRecord
  has_many :posts, foreign_key: 'creator_id', dependent: :destroy
  
  has_many :post_editors, dependent: :destroy
  has_many :edited_posts, through: :post_editors, source: :post
end