class UserInvoice < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :user

  def total
    [rent, power, water, upkeep, other_sum, trash, heating, gas].sum { |e| e||0 }
  end
end
