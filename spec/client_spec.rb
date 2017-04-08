require('spec_helper')

describe(Client) do

  describe(".all") do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
end

describe("#==") do
  it("is the same client if it has the same name") do
    client1 = Client.new({:name => "Badher Dae", :id => nil})
    client2 = Client.new({:name => "Badher Dae", :id => nil})
    expect(client1).to(eq(client2))
  end
end

describe("#save") do
  it("adds a client to the array of saved clients") do
    client = Client.new({:name => "Badher Dae", :stylist_id => 1})
    client.save()
    expect(Client.all()).to(eq([client]))
  end
end

describe("#stylist_id") do
  it("lets you read the stylist ID out") do
    test_client = Client.new({:name => "Badher Dae", :stylist_id => 1})
    expect(test_client.stylist_id()).to(eq(1))
  end
end

end
