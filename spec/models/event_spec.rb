require 'rails_helper'

RSpec.describe Event, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "データが正しく保存される" do
    before(:each) do
      @user = create(:user)
    end
    before do
      @event = Event.new(title: "練習試合",
      user_id: "1")
    end
    it "全て入力してあるので保存される" do
      expect(@event).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before(:each) do
      @user = create(:user)
    end
    before do
      @event = Event.new(title: "練習試合",
      user_id: "")
    end
    it "user_idが入力されていないので保存されない" do
      expect(@event).to be_invalid
    end
  end
end
