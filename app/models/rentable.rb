class Rentable < ActiveRecord::Base
  belongs_to :admin
  has_many :users

  enum category: [:flat, :room]
end
