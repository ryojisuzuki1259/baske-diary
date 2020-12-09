require 'rails_helper'

RSpec.describe DiaryComment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "データが正しく保存される" do
    before(:each) do
      @user = create(:user)
      @diary = create(:diary)
    end
    before do
      @diary_comment = DiaryComment.new(body: "頑張りました",
      user_id: "1", diary_id: "1")
    end
    it "全て入力してあるので保存される" do
      expect(@diary_comment).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before(:each) do
      @user = create(:user)
      @diary = create(:diary)
    end
    before do
     @diary_comment = DiaryComment.new(body: "",
      user_id: "1", diary_id: "1")
    end
    it "bodyが入力されていないので保存されない" do
      expect(@diary_comment).to be_invalid
    end
  end
end
