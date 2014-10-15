require 'rails_helper'

RSpec.describe "User Pages", :type => :request do


  subject { page }


  describe "signup page" do
    before { visit signup_path }
    it "Should have an h1 Sign up" do
      expect(page)
      .to have_selector('h1', text: 'Sign up')
    end

    it "should have the right title" do
      expect(page)
      .to have_selector(
      'title', text: full_title("Sign up"), visible: false)
    end

    it "should have the right links on the layout" do
      visit root_path
      click_link "Sign in"
      expect(page)
        .to have_selector('title', text: full_title('Sign in'), visible: false)
      click_link "About"
      expect(page)
        .to have_selector('title', text: full_title('About us'), visible: false)
      click_link "Contact"
      expect(page)
        .to have_selector('title', text: full_title('Contact us'), visible: false)
      click_link "Sign up"
      expect(page)
        .to have_selector('title', text: full_title('Sign up'), visible: false)
    end
  end


  describe "profile page" do
    let(:test_user) { Fabricate(:user) }

    it "has a valid fabricator" do
      expect(test_user)
        .to be_valid
    end

    before { visit user_path(test_user) }

    it "Should have an h1 user name" do
      expect(page)
      .to have_selector('h1', text: test_user.name)
    end

    it "should have the user name as title" do
      expect(page)
      .to have_selector(
      'title', text: full_title(test_user.name), visible: false)
    end
  end


  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do

      it "should not create a user" do
        expect { click_button submit }.not_to change { User.count }
      end
    end

    describe "after submission" do

      before { click_button submit }

      it "should have the new view title" do
         expect(page).to have_selector('title', text: full_title(nil), visible: false)
       end

      it { should have_content('errors') }
    end

    describe "with valid information" do

      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change { User.count }.by(1)
      end

      describe "after saving a user" do

        before { click_button submit }

        let(:user) { User.find_by_email("user@example.com") }

        it "should redirect to the user's show view" do
          expect(page).to have_selector('title', text: full_title(user.name), visible: false)
        end

        it {should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end


  describe "edit" do
    let(:user) { Fabricate(:user) }
    before { visit edit_user_path(user) }

    describe "page" do
      it { should have_selector('h1', text: "Update your profile") }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }
      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name) {"New_name"}
      let(:new_email) {"new@example.com"}
      before do
        fill_in "Name", with: new_name
        fill_in "Email", with: new_email
        fill_in "Password", with: user.password 
        fill_in "Password Confirmation", with: user.password
        click_button "Save changes"
      end
      it "should update the users attributes" do
        expect(user.reload.name).to eq("New_name")
        expect(user.reload.email).to eq("new@example.com")
      end
    end
  end
end
