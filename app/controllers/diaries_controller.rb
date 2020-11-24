class DiariesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @diaries = @user.diaries
  end

  def new
    @diary = Diary.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
