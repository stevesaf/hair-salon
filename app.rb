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

get("/new_stylist") do
  erb(:stylist_form)
end

post("/stylists") do
  name = params.fetch("name") #Get new stylists name the boss enters from the parameters.
  stylist= Stylist.new({:name => name, :id => nil}) #Create a new stylist object using this name. id will remain nil until assigned by database.
  stylist.save()
  erb(:stylist_success)
end

post("/clients") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  @mumu = Stylist.find(stylist_id)
  @client = Client.new({:name => name, :stylist_id => stylist_id})
  @client.save()
  erb(:stylist_success) #issue here where if i dont go to success I get an error. Ask instructor!!
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

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylists = Stylist.all()
  erb(:stylist)
end

delete("/stylists/:id") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    @stylist.delete()
    @stylists = Stylist.all() #must include as the page needs to see all stylists.
    erb(:stylists)
  end

  # get("/stylists/:id/edit") do
  #   @stylist = Stylist.find(params.fetch("id").to_i())
  # erb(:stylist)
  # end

  patch("/stylists/:id") do
    name = params.fetch("name")
    @stylist = Stylist.find(params.fetch("id").to_i())
    @stylist.update({:name => name})
    @stylists = Stylist.all()
    erb(:stylist)
  end
