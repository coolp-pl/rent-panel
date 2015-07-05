class Invoice < ActiveRecord::Base
  belongs_to :rentable
  has_many :user_invoices, :dependent => :delete_all

  accepts_nested_attributes_for :user_invoices
end
