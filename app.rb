require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")
require("pry")

DB = PG.connect({:dbname => "hair_salon"}) #DB constant used here to connect to non-test database.

get("/") do
  erb(:index)
end

get("/stylists/new") do
  erb(:stylist_form)
end

post("/stylists") do
  stylist = params.fetch('name') #Get new stylists name the boss enters from the parameters.
  Stylist.new({:name => name, :id => nil}).save() #Create a new stylist object using this name. id will remain nil until assigned by database.
  stylist.save()
  erb(:stylist_success)
end

get("/stylists") do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:stylists)
end

get("/clients") do
  @clients = Client.all()
  erb(:clients)
end
