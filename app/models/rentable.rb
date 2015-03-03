class Rentable < ActiveRecord::Base
  belongs_to :admin

  enum category: [:flat, :room]
end
