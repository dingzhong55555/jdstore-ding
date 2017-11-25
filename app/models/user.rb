class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :like_items
  has_many :liked_products, through: :like_items, source: :product
  has_many :orders
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  def add_product_to_likes(product)
    like_product = like_items.new
    like_product.product = product
    like_product.save
  end
end
