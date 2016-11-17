class Product < ActiveRecord::Base
  belongs_to :category

  validates :name, :description, :category_id, presence: true

  validates :cost, :sell_price,
          numericality: {
            greater_than_or_equal_to: 0
          }
end
