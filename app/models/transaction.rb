class Transaction < ActiveRecord::Base
  belongs_to :product

  def total_charge
    unit_charge * quantity * -1
  end

end
