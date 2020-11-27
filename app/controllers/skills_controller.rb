class SkillsController < ApplicationController
  def show
  end

  def new
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user_id = current_user.id
    if @skill.save
      redirect_to user_path(@skill.user), notice: "登録しました！"
    else
      render 'user/show'
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to user_path(@skill.user)
    else
      render 'user/show'
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to user_path(current_user)
  end

  private
  def skill_params
    params.require(:skill).permit(:name, :level)
  end
end
