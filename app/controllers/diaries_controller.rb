class DiariesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @diaries = @user.diaries
    @diary = Diary.find(params[:id])
    @diary_comment = DiaryComment.new
    @diary_comments = @diary.diary_comments
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    if @diary.save
      redirect_to diary_path(@diary), notice: "投稿しました！"
    else
      render 'user/show'
    end
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to diary_path(@diary), notice: "編集しました！"
    else
      render 'user/show'
    end
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to user_path(current_user)
  end

  private
  def diary_params
    params.require(:diary).permit(:title, :body)
  end

end
