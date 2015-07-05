# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities)

admin1 = Admin.create!(email: "lol@lol.lol", :password => '12345678', :password_confirmation => '12345678', first_name: "Admin_Imie_1", last_name: "Admin_Nazwisko_1")
admin2 = Admin.create(email: "2lol@lol.lol", :password => '12345678', :password_confirmation => '12345678', first_name: "Admin_Imie_2", last_name: "Admin_Nazwisko_2")

rentable1 = Rentable.create!(category: :flat, city: "Kraków", street: "Dietla 1", zip: "30-300", inventory: "szczotka\nwódka", admin_id: admin1.id, account_number: "1000 1000 2000 3000 4000", transfer_address: "Borecka 123 40-400 Zadupie", transfer_title: "umowa nr: #985")
rentable2 = Rentable.create!(category: :room, city: "Kraków", street: "Dietla 3", zip: "30-300", inventory: "szczotka\nwódka", admin_id: admin1.id, account_number: "1000 1000 2000 3000 4000", transfer_address: "Borecka 123 40-400 Zadupie", transfer_title: "umowa nr: #986")
rentable3 = Rentable.create!(category: :room, city: "Kraków", street: "Dietla 3", zip: "30-300", inventory: "szczotka\nwódka\nkieliszki", admin_id: admin2.id, account_number: "1000 1000 2000 3000 4001", transfer_address: "Borecka 123 40-400 Zadupie", transfer_title: "umowa nr: #987")

user1 = User.create!(email: 'omg@omg.omg', :password => '12345678', :password_confirmation => '12345678', :first_name => 'Frajer1', :last_name => 'Frajerski', :rentable_id => rentable1.id)
user2 = User.create!(email: '2omg@omg.omg', :password => '12345678', :password_confirmation => '12345678', :first_name => 'Frajer2', :last_name => 'Frajerski', :rentable_id => rentable1.id)
user3 = User.create!(email: '3omg@omg.omg', :password => '12345678', :password_confirmation => '12345678', :first_name => 'Frajer3', :last_name => 'Frajerski', :rentable_id => rentable2.id)
user4 = User.create!(email: '4omg@omg.omg', :password => '12345678', :password_confirmation => '12345678', :first_name => 'Frajer4', :last_name => 'Frajerski', :rentable_id => rentable3.id)
user5 = User.create!(email: '5omg@omg.omg', :password => '12345678', :password_confirmation => '12345678', :first_name => 'Frajer5', :last_name => 'Frajerski')

invoice1 = Invoice.create!(:rentable_id => rentable1.id, :due => Date.current.prev_month, :paid => true)
UserInvoice.create!(:invoice_id=>invoice1.id, :user_id=>user1.id, :rent=>200, :trash=>20, :heating=>50, :upkeep=>50, :power=>100, :power_price=>2, :power_usage=>50, :water=>480, :hot_water_price=>2, :hot_water_usage=>40, :cold_water_price=>5, :cold_water_usage=>80, :other_name=>'kara za chlanie 1', :other_sum=>5000)
UserInvoice.create!(:invoice_id=>invoice1.id, :user_id=>user2.id, :rent=>200, :trash=>20, :heating=>50, :upkeep=>50, :power=>100, :power_price=>2, :power_usage=>50, :water=>480, :hot_water_price=>2, :hot_water_usage=>40, :cold_water_price=>5, :cold_water_usage=>80, :other_name=>'kara za chlanie 2', :other_sum=>5000)
invoice2 = Invoice.create!(:rentable_id => rentable2.id, :due => Date.current.prev_month.prev_month, :paid => true)
UserInvoice.create!(:invoice_id=>invoice2.id, :user_id=>user1.id, :rent=>200, :trash=>20, :heating=>50, :upkeep=>50, :power=>100, :power_price=>2, :power_usage=>50, :water=>480, :hot_water_price=>2, :hot_water_usage=>40, :cold_water_price=>5, :cold_water_usage=>80, :other_name=>'kara za chlanie 3', :other_sum=>5000)

invoice3 = Invoice.create!(:rentable_id => rentable1.id, :due => Date.current, :paid => true)
UserInvoice.create!(:invoice_id=>invoice3.id, :user_id=>user1.id, :rent=>200, :trash=>20, :heating=>50, :upkeep=>50, :power=>100, :power_price=>2, :power_usage=>50, :water=>480, :hot_water_price=>2, :hot_water_usage=>40, :cold_water_price=>5, :cold_water_usage=>80, :other_name=>'kara za chlanie 1b', :other_sum=>5000)
UserInvoice.create!(:invoice_id=>invoice3.id, :user_id=>user2.id, :rent=>200, :trash=>20, :heating=>50, :upkeep=>50, :power=>100, :power_price=>2, :power_usage=>50, :water=>480, :hot_water_price=>2, :hot_water_usage=>40, :cold_water_price=>5, :cold_water_usage=>80, :other_name=>'kara za chlanie 2b', :other_sum=>5000)
invoice4 = Invoice.create!(:rentable_id => rentable2.id, :due => Date.current, :paid => false)
UserInvoice.create!(:invoice_id=>invoice4.id, :user_id=>user3.id, :rent=>200, :trash=>20, :heating=>50, :upkeep=>50, :power=>100, :power_price=>2, :power_usage=>50, :water=>480, :hot_water_price=>2, :hot_water_usage=>40, :cold_water_price=>5, :cold_water_usage=>80, :other_name=>'kara za chlanie 1b', :other_sum=>5000)
invoice5 = Invoice.create!(:rentable_id => rentable3.id, :due => Date.current, :paid => false)
UserInvoice.create!(:invoice_id=>invoice5.id, :user_id=>user4.id, :rent=>200, :trash=>20, :heating=>50, :upkeep=>50, :power=>100, :power_price=>2, :power_usage=>50, :water=>480, :hot_water_price=>2, :hot_water_usage=>40, :cold_water_price=>5, :cold_water_usage=>80, :other_name=>'kara za chlanie 2b', :other_sum=>5000)
