require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  render_views

  describe "GET home" do  

    before {get :home}

    it "returns http success" do
      expect(response).to be_success
    end

    it "should have the right template" do
      expect(response).to render_template("home")
    end

    it "should have the right title" do
      expect(response.body).to have_selector("title", text: full_title('Home'), visible: false)
    end

    it "should have the h1 'Welcome'" do
      expect(response.body).to have_selector("h1", text: "Welcome", visible: true)
    end

    it "should have a non-blank body" do
       expect(response.body).not_to match(/<body>\s*<\/body>/)
    end
  end


  describe "GET contact" do
    before {get :contact}
    it "returns http success" do
      expect(response).to be_success
    end

    it "should have the right template" do
      expect(response).to render_template("contact")
    end

    it "should have the right title" do
      expect(response.body).to have_selector("title", text: "RoR Tutorial Sample App | Contact", visible: false)
    end
  end


  describe "GET about" do
    before {get :about}
    it "returns http success" do
      expect(response).to be_success
    end

    it "shoud have the right template" do
      expect(response).to render_template("about")
    end

    it "should have the right title" do
      expect(response.body).to have_selector("title", text: "RoR Tutorial Sample App | About us", visible: false)
    end
  end
end
