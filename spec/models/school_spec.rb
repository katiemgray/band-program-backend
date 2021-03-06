require 'rails_helper'

RSpec.describe School, :type => :model do
  subject {
    described_class.new(
      name: "Test School Name"
    )
  }

  describe "Validations" do 
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do 
      subject.name = nil
      expect(subject).to_not be_valid
    end 
  end

  describe "Associations" do 
    it {should have_many(:music_pieces)}
    it {should have_many(:students)}
    it {should have_many(:instrument_inventory_items)}
  end

  
end
