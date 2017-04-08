require('spec_helper') #since we have compounded the require lists into spec_helper, we only need to require that here.

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end


end
