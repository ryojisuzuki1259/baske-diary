class SkillsController < ApplicationController
  def show
  end

  def new
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user_id = current_user.id
    @skill.save
    @user = @skill.user
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.update(skill_params)
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    @user = @skill.user
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :level)
  end
end
