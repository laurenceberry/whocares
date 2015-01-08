class RolesController < ApplicationController
  def create
    @profession = Profession.find(params[:profession_id])
    @role = @profession.roles.create(role_params)
    redirect_to profession_path(@profession)
  end

  def show
    @profession = Profession.find(params[:profession_id])
    @role = @profession.roles.find(params[:id])
  end

  def new
    @profession = Profession.find(params[:profession_id])
    @role = Role.new
  end

  def update
    @profession = Profession.find(params[:profession_id])
    @role = @profession.roles.find(params[:id])
    @role.update_attributes(role_params)
    redirect_to profession_path(@profession)
    return
  end

  def edit
    @profession = Profession.find(params[:profession_id])
    @role = @profession.roles.find(params[:id])
  end

  def destroy
    @profession = Profession.find(params[:profession_id])
    @role = @profession.roles.find(params[:id])
    @role.destroy
    redirect_to profession_path(@profession)
  end

  private
    def role_params
      params.require(:role).permit(:name, :description)
    end
end
