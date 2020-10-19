require "spec_helper"

describe Task do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :status }
    it { should validate_presence_of :priority }
    it { should  validate_presence_of :deadline}
  end

  describe "associations" do
    it { should belong_to :project }
  end
end
