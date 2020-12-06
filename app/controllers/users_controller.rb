class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @diary = Diary.new
    @diaries = @user.diaries
    @skill = Skill.new
    @skills = @user.skills
  end
end
