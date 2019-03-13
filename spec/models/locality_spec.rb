require 'rails_helper'

RSpec.describe Locality, type: :model do


# clean de la database svp!
Locality.destroy_all


  before(:each) do
		@valid_locality = Locality.create!(
  city_name: "grenoble",
  zipcode: "38000 en force",
  address: "cherche encore"
  )
  end


	context "validation" do

		it "is valide with valide attributes" do
			expect(@valid_locality).to be_a(Locality)
			expect(@valid_locality).to be_valid
		end

		describe "#city_name" do
      it "should not be valid whitout a city_name" do
      	@valid_locality.city_name = ""
        expect(@valid_locality).not_to be_valid
      end
    end

    describe "#zipcode" do
      it "should not be valid whitout a zipcode" do
      	@valid_locality.zipcode = ""
        expect(@valid_locality).not_to be_valid
      end
    end

    describe "#adress" do
      it "should not be valid whitout an adress" do
      	@valid_locality.address = ""
        expect(@valid_locality).not_to be_valid
      end
    end
  end

end