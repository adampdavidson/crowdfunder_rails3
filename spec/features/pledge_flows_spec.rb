require 'spec_helper'

describe "PledgeFlows" do
  describe "when visiting the pledge page" do
    before(:each) do
    	@project = FactoryGirl.create :project
    end

    it "should require an authenticated user" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
		visit project_path(@project)

		click_link 'Back This Project'

		#Should be at pledge submission page, with 0 helpers
		expect(current_path).to eq(new_session_path)
		expect(page).to have_content("Please login first.")

		fill_on 'pledge[amount]', with: 100
		click_button 'Pledge Now'

		#Should be redirected back to project page with thank you message
		expect(current_path).to eq(project_path(@project))
		expect(page).to have_content("Thanks for pledging")

		#Verify that the pledge was created with the right attributes
		pledge = Pledge.order(:id).last

		expect(pledge.user).to eq(user)
		expect(pledge.project).to eq(@project)
		expect(pledge.amount).to eq(100)
		expect(last_email.to).to eq([@project.user.email])
	end

    end
  end
end
