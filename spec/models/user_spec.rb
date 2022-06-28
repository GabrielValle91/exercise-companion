require 'rails_helper'

describe User do
    let(:user) { User.new(email: "", password: "password", first_name: "first", last_name: "last")}
    it "can return a string of both the first and last name" do    
        expect(user.full_name).to eq("first last")
    end
end