require './lib/ship'

Rspec.describe Ship do
    before(:each) do
    @cruiser = Ship.new("Cruiser", 3)

    end

    it "exists and has attributes" do
        expect(@cruiser.name).to eq("Cruiser")
        expect(@cruiser.length).to eq(3)
        expect(@cruiser.health).to eq(3)
    end

    it "can get hit and lose health/sink" do
        
        expect(@cruiser.sunk?).to be(false)
        @cruiser.hit
        expect(@cruiser.health).to eq(2)
        @cruiser.hit
        expect(@cruiser.health).to eq(1)
        expect(@cruiser.sunk?).to be(false)
        @cruiser.hit
        expect(@cruiser.sunk?).to be(true)
    end












