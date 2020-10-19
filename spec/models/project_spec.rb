require "spec_helper"

describe Project do
  describe "validations" do
    it { should validate_presence_of :name }
  end
  describe "associations" do
    it { should have_many :tasks }
    it { should belong_to :user }
  end
end
