
require 'rails_helper'

describe ApplicationHelper do 
  describe "full_title" do
    it "should incude the page name" do
      expect(full_title('foo')).to match(/foo/)
    end

    it "should include the base name" do
      expect(full_title('foo')).to match(/^RoR Tutorial Sample App/)
    end

    it "should not include a bar on the home page" do
      expect(full_title('foo')).to match(/\|/)
    end
  end
end