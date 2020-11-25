class DiariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user #find(params[id])だと保存後、ダイアリーのidと同じidでユーザーidを探そうとしてしまう
    @diaries = @user.diaries
  end

  def show
    @diary = Diary.find(params[:id])
    @diary_comment = DiaryComment.new
    @user = current_user
    @diary_comments = @user.diary_comments
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    if @diary.save
      redirect_to diary_path(@diary), notice: "投稿完了しました！"
    else
      render 'show'
    end
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to diary_path(@diary), notice: "編集完了しました！"
    else
      render 'show'
    end
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diary_path(@diary)
  end

  private
  def diary_params
    params.require(:diary).permit(:title, :body)
  end

end
