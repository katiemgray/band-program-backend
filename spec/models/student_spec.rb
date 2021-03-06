require 'rails_helper'

RSpec.describe Student, :type => :model do
  let(:school) { School.create(name: "test")}
  let(:instrument_family) { InstrumentFamily.create(name: "brass")}
  let(:instrument_type) { InstrumentType.create(name: "trumpet", instrument_family_id: instrument_family.id) }

  subject {
    described_class.new(
      first_name: "Link",
      last_name: "Tothepast",
      grade: 4,
      school_id: school.id,
      instrument_type_id: instrument_type.id
    )
  }

  describe "Validations" do 
    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a grade" do
      subject.grade = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if grade is below 4" do 
      subject.grade = 1
      expect(subject).to_not be_valid
    end

    it "is not valid if grade is above 12" do 
      subject.grade = 13
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do 
    it { should belong_to(:school) }
    it { should belong_to(:instrument_type)}
  end
end