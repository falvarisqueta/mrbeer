class Product < ActiveRecord::Base
  attr_accessor :quantity, :sale_price, :purchase_cost

  belongs_to :category
  belongs_to :provider

  validates :name, :description, :category_id, :provider_id, presence: true

  validates :cost, :sell_price, :stock,
          numericality: {
            greater_than_or_equal_to: 0
          }

  def add_stock(quantity, stock_cost)
    next_stock = stock.nil? ? quantity : stock + quantity
    product_cost = stock_cost / quantity
    update_attributes(stock: next_stock, cost: product_cost)
    Transaction.create(
      product_id: id,
      quantity: quantity,
      unit_charge: product_cost,
    )
  end

  def sell(quantity)
    next_stock = stock - quantity
    ActiveRecord::Base.transaction do
      update_attributes(stock: next_stock)
      Transaction.create(
        product_id: id,
        quantity: quantity * -1,
        unit_charge: sell_price / quantity,
      )
    end
  end

  def beer?
    category.name.upcase == 'CERVEZA'
  end

end
