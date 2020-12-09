class DiaryCommentsController < ApplicationController
  def create
    @diary = Diary.find(params[:diary_id])
    @comment = current_user.diary_comments.new(diary_comment_params)
    @comment.diary_id = @diary.id
    @comment.save
    # redirect_to diary_path(@diary)　非同期設定のためコメントアウト、create.js.erbにいく
  end

  def destroy
    @comment = DiaryComment.find(params[:id])
    @comment.destroy
    @diary = @comment.diary
    # redirect_to diary_path(@comment.diary)　非同期設定のためコメントアウト、destroy.js.erbにいく
  end

  private

  def diary_comment_params
    params.require(:diary_comment).permit(:body)
  end
end
