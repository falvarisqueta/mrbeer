class Product < ActiveRecord::Base
  attr_accessor :quantity

  belongs_to :category
  belongs_to :provider

  validates :name, :description, :category_id, :provider_id, presence: true

  validates :cost, :sell_price,
          numericality: {
            greater_than_or_equal_to: 0
          }

  def add_stock(quantity)
    next_stock = stock.nil? ? quantity : stock + quantity
    update_attribute(:stock, next_stock)
    Transaction.create(
      product_id: id,
      quantity: quantity,
      unit_charge: cost,
    )
  end

  def sell(quantity)
    next_stock = stock - quantity
    update_attribute(:stock, next_stock)
    Transaction.create(
      product_id: id,
      quantity: quantity * -1,
      unit_charge: sell_price,
    )
  end

  def beer?
    category.name.upcase == 'CERVEZA'
  end

end
