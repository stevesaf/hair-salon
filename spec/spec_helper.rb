require("rspec")
  require("pg")
  require("client")
  require("stylist")

  DB = PG.connect({:dbname => "hair_salon_test"}) #DB is called a constant. It's a variable available everywhere in the program, used only for settings like the name of our database.

  RSpec.configure do |config|
    config.after(:each) do
      DB.exec("DELETE FROM client *;") #we do this to clear database between spec runs
      DB.exec("DELETE FROM stylist *;")
    end
  end
