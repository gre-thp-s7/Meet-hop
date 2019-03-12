
  require 'rails_helper'

RSpec.describe User, type: :model do

# clean de la database svp!
User.destroy_all


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
  end


	context "validation" do

		it "is valide with valide attributes" do
			expect(@valid_user).to be_a(User)
			expect(@valid_user).to be_valid
		end

		describe "#first_name" do
      it "should not be valid whitout first_name" do
      	@valid_user.first_name = ""
        expect(@valid_user).not_to be_valid
      end
    end

    describe "#last_name" do
      it "should not be valid whitout last_name" do
      	@valid_user.last_name = ""
        expect(@valid_user).not_to be_valid
      end
    end


    describe "#email" do
      it "should not be valid without email" do
      	@valid_user.email = ""
        expect(@valid_user).not_to be_valid
      end
    end

    describe "#email" do
      it "should not be valid with wrong email" do
      	@valid_user.email = "yopmail.com"

				expect(@valid_user).not_to be_valid
      end
    end

    describe "#email" do
      it "should not be valid with wrong email" do
      	@valid_user.email = "yopmail@gamelcom"
				expect(@valid_user).not_to be_valid
      end
    end

    describe "#nick_name" do
      it "should not be valid with a already taken nick_name" do
    @user_with_already_taken_nick_name = User.create(
      first_name: "first_nqdzvame", 
      last_name: "last_efvname", 
      nick_name: "god",
      avatar_url: "",
      phone: "06 38 14 81 19",
      email: "mail@yopmail.com",
      password: "azeaze"
      )
        expect(@user_with_already_taken_nick_name).not_to be_valid
      end
    end

  end
end
