require 'rails_helper'

RSpec.describe "UserPages", :type => :request do
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it "Should have an h1 Sign up" do
      expect(page).to have_selector('h1', text: 'Sign up')
    end
    
    it "should have the right title" do
      expect(page).to have_selector('title', text: full_title("Sign up"), visible: false)
    end

    it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      expect(page).to have_selector( 'title', text: full_title('About Us'), visible: false)
      click_link "Help"
      expect(page).to have_selector( 'title', text: full_title('Help'), visible: false)
      click_link "Home"
      expect(page).to have_selector( 'title', text: full_title('Home'), visible: false)
    end
  end
end
