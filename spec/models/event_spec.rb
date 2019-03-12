require 'rails_helper'




RSpec.describe Event, type: :model do

# clean de la db svp !
User.destroy_all
if Event.all == nil
Event.destroy_all
end



  before(:each) do
		@valid_user = User.create!(
			first_name: "first_name", 
			last_name: "last_name", 
			email: "mail@yopmail.com"
			)

		@valid_event = Event.create!(
			title: "diner",
			description: "la bonne bouffe a VB",
			start_date: Time.now + 1.day,
			duration: 90 ,
			price: 5 ,
			location: "V-B" ,
			admin_id: @valid_user.id)
	end

	context "validation" do

		it "is valide with valide attributes" do
			expect(@valid_event).to be_a(Event)
			expect(@valid_event).to be_valid
		end

		describe "#title" do
      it "should not be valid whitout a title" do
		    @valid_event.title = nil
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

    describe "#price" do
      it "should not be valid without a price" do
		    @valid_event.price = nil       
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#location" do
      it "should not be valid without a location" do
		    @valid_event.location = nil       
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#admin_id" do
      it "should not be valid without a creator" do
		    @valid_event.admin_id = nil       
        expect(@valid_event).not_to be_valid
      end
    end

############################ missing attribute ##########@



    describe "#price" do
      it "should not be valid without price < 1" do
        @valid_event.price = 0
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#price" do
      it "should not be valid without a price > 1000" do
		    @valid_event.price = 1001       
        expect(@valid_event).not_to be_valid
      end
    end


    describe "#start_date" do
      it "should not be valid without a past date (=< Time.now)" do
		    @valid_event.start_date = Time.now - 1.day      
        expect(@valid_event).not_to be_valid
      end
    end


    describe "#title" do
      it "should not be valid with title > 140 char" do
		    @valid_event.title = "a"*141       
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#title" do
      it "should not be valid with title < 5 char" do
		    @valid_event.title = "a"*4       
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


    describe "#duration" do
      it "should not be valid with a duration whoose not by 5 divideable" do
		    @valid_event.duration = 7       
        expect(@valid_event).not_to be_valid
      end
    end
  end
end
