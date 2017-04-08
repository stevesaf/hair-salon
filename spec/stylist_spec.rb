require('spec_helper') #since we have compounded the require lists into spec_helper, we only need to require that here.

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#==") do #this is for testing purposes. The == method overrides the existing == method so that we can compare two objects that are exactly the same, but different to the computer.
    it("is the same stylist if it has the same name") do
      stylist1 = Stylist.new({:name => "Guy Hairdeux", :id => nil})
      stylist2 = Stylist.new({:name => "Guy Hairdeux", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe("#save") do
    it("adds a stylist to the array of saved stylists") do
      stylist = Stylist.new({:name => "Guy Hairdeux", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#name") do
        it("tells you the stylist's name") do
            stylist = Stylist.new({:name => "Stylist Thefirst", :id => nil})
            expect(stylist.name()).to(eq("Stylist Thefirst"))
        end
    end

end
