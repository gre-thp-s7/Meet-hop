require 'rails_helper'
RSpec.describe Event, type: :model do

User.destroy_all
if Event.all == nil
Event.destroy_all
end



  before(:each) do
    @valid_user = User.create!(
      first_name: "first_name", 
      last_name: "last_name", 
      nick_name: "god",
      avatar_url: "",
      phone: "06 84 14 81 19",
      is_god: true,
      email: "thp.sess7.gre@gmailmail.com",
      password: "azeaze"      
      )

		@valid_event = Event.create!(
			name: "battle royale",
			description: "Il s'agit d'un event bla bla bla bla bla",
			start_date: (Time.now + 1.day),
			duration: 90 ,
      spectator_price: rand(5..10),
      dancer_price: rand(10..20),
      prize_money: "100 patates",
      rules: "un seul doit survivre",
      promoter_id: @valid_user.id,
      address: "10 rue du pont",
      zipcode: "38000",
      city_name: "Grenoble"
      )
  end

	context "validation" do

		it "is valide with valide attributes" do
			expect(@valid_event).to be_a(Event)
			expect(@valid_event).to be_valid
		end

		describe "#title" do
      it "should not be valid whitout a title" do
		    @valid_event.name = nil
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#description" do
      it "should not be valid whitout a description" do
		    @valid_event.description = nil
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#start_date" do
      it "should not be valid without a start_date" do
		    @valid_event.start_date = nil 
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#duration" do
      it "should not be valid without a duration" do
		    @valid_event.duration = nil       
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#spectator_price" do
      it "should not be valid without a price" do
		    @valid_event.spectator_price = nil       
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#promoter" do
      it "should not be valid without a promoter" do
		    @valid_event.promoter_id = nil       
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#address" do
      it "should not be valid without a address" do
		    @valid_event.address = nil       
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#city_name" do
      it "should not be valid without a city name" do
		    @valid_event.city_name = nil       
        expect(@valid_event).not_to be_valid
      end
    end
    
    describe "#zipcode" do
      it "should not be valid without a zipcode" do
		    @valid_event.zipcode = nil       
        expect(@valid_event).not_to be_valid
      end
    end
  #================ Missing attribute ==============

    describe "#start_date" do
      it "should not be valid without a past date (=< Time.now)" do
		    @valid_event.start_date = Time.now - 1.day      
        expect(@valid_event).not_to be_valid
      end
    end


    describe "#name" do
      it "should not be valid with title > 140 char" do
		    @valid_event.name = "a"*141       
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#title" do
      it "should not be valid with title < 5 char" do
		    @valid_event.name = "a"*4       
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#description" do
      it "should not be valid with description < 20 char" do
		    @valid_event.description = "a"*19       
        expect(@valid_event).not_to be_valid
       end
    end

    describe "#description" do
      it "should not be valid with description > 1000 char" do
		    @valid_event.description = "a"*1001       
        expect(@valid_event).not_to be_valid 
      end
    end
  end
end
