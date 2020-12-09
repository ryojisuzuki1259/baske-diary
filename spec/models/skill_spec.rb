require 'rails_helper'

RSpec.describe Skill, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "データが正しく保存される" do
    before(:each) do
      @user = create(:user)
    end
    before do
      @skill = Skill.new(name: "シュート",
      user_id: "1")
    end
    it "全て入力してあるので保存される" do
      expect(@skill).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before(:each) do
      @user = create(:user)
    end
    before do
      @skill = Skill.new(name: "",
      user_id: "1")
    end
    it "nameが入力されていないので保存されない" do
      expect(@skill).to be_invalid
      expect(@skill.errors[:name]).to include("を入力してください")
    end
  end
end
