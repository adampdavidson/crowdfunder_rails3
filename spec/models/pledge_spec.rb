require 'spec_helper'

describe Pledge do
  it "should require a user" do
  	pledge = FactoryGirl.build(:pledge, user_id: nil)

  	#Should not be able to save
  	pledge.should_not == pledge.save

  	#pledge.should have(1).errors_on(:user)
  	expect(pledge).to have(1).errors_on(:user_id)
  end

  it "should require a project" do
  	pledge = FactoryGirl.build(:pledge, project_id: nil)

  	#Should not be able to save
  	pledge.should_not == pledge.save

  	expect(pledge).to have(1).errors_on(:project_id)
  end

  it "should require an amount" do
  	pledge = FactoryGirl.build(:pledge, amount: nil)

  	  	#Should not be able to save
  	pledge.should_not == pledge.save

  	expect(pledge).to have(1).errors_on(:amount)
  end

  it "should require amount to be greater than 0" do
  	pledge = FactoryGirl.build(:pledge, amount: -10)

  	  	#Should not be able to save
  	pledge.should_not == pledge.save

  	expect(pledge).to have(1).errors_on(:amount)
  end

  it "should require amount to be an integer" do 
  	pledge = FactoryGirl.build(:pledge, amount: "abc")

  	  	#Should not be able to save
  	pledge.should_not == pledge.save

  	expect(pledge).to have(1).errors_on(:amount)
  end

end
