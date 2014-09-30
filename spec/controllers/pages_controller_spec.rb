require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
render_views
  describe "GET home" do
    it "returns http success" do
      get 'home'
      expect(response).to be_success
    end

    it "should have the right template" do
      get 'home'
      expect(response).to render_template("home")
    end

    it "should have the right title" do
      get "home"
      expect(response.body).to have_selector("title",text:"RoR Tutorial Sample App | Home", visible: false)
    end

    it "should have a non-blank body" do
       get 'home'
       expect(response.body).not_to match(/<body>\s*<\/body>/)
    end
  end

  describe "GET contact" do
    it "returns http success" do
      get 'contact'
      expect(response).to be_success
    end

    it "should have the right template" do
      get 'contact'
      expect(response).to render_template("contact")
    end

    it "should have the right title" do
      get "contact"
      expect(response.body).to have_selector("title",text:"RoR Tutorial Sample App | Contact", visible: false)
    end
  end

  describe "GET about" do
    it "returns http success" do
      get 'about'
      expect(response).to be_success
    end

    it "shoud have the right template" do
      get 'about'
      expect(response).to render_template("about")
    end

    it "should have the right title" do
      get "about"
      expect(response.body).to have_selector("title",text:"RoR Tutorial Sample App | About", visible: false)
    end
  end


end
