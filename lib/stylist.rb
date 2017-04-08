class Stylist

attr_reader(:name, :id) #We place these here so that we do not need to define the variables below initialize

define_method(:initialize) do |attributes|
  @name = attributes.fetch(:name)
  @id = attributes[:id] #We place id as such because it will be automatically assigned from DB; we are not fetching from input data.
end

define_singleton_method(:all) do
  returned_stylists = DB.exec("SELECT * FROM stylist;") #Here, we are selecting all of the stylists from the stylist table in the DB. We loop through each of them and pull out their name and id, create a new Stylist object and push it into an array.
  stylists = []
  returned_stylists.each() do |stylist|
    name = stylist.fetch("name")
    id = stylist.fetch("id").to_i() #we need to put the id to an integer as the information that comes out of the DB is in a string.
    stylists.push(Stylist.new({:name => name, :id => id})) #Setting the key => value pair for the hash that will contain the information we need to draw
  end
  stylists
end






end
