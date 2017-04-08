class Client

  attr_reader(:name, :stylist_id) #in the scope of this project, a client only must appear under a stylist-- not have a profile. So, we will input a name and match them with a stylist's id.

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes[:stylist_id] #similar to a stylist's id, this will be assigned and not input, so no need for fetch()
  end

define_singleton_method(:all) do #see stylist.rb for explanation
  returned_clients = DB.exec("SELECT * FROM client;")
  clients = []
  returned_clients.each() do |client|
    name = client.fetch("name")
    stylist_id = client.fetch("stylist_id").to_i()
    clients.push(Client.new({:name => name, :stylist_id => stylist_id}))
  end
  clients
end

define_method(:==) do |another_client|
  self.name().==(another_client.name()).&(self.stylist_id().==(another_client.stylist_id()))
end

define_method(:save) do
  DB.exec("INSERT INTO client (name, stylist_id) VALUES ('#{name}', #{stylist_id});") ##{} is called string interpolation and makes it easier to insert variables into a string.
end



end
