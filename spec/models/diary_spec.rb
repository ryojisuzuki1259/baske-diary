require 'rails_helper'

RSpec.describe Diary, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "データが正しく保存される" do
    before(:each) do
      @user = create(:user)
    end
    before do
      @diary = Diary.new(title: "練習試合",
        body: "スタメン出場", user_id: "1")
    end
    it "全て入力してあるので保存される" do
      expect(@diary).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before(:each) do
      @user = create(:user)
    end
    before do
      @diary = Diary.new(title: "",
        body: "スタメン出場", user_id: "1")
    end
    it "titleが入力されていないので保存されない" do
      expect(@diary).to be_invalid
      expect(@diary.errors[:title]).to include("を入力してください")
    end
  end
end
