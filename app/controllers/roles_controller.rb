class RolesController < ApplicationController
  load_and_authorize_resource

  def create
    before_filter :authenticate_admin!, :except => [:show, :index]
    @profession = Profession.find(params[:profession_id])
    @role = @profession.roles.create(role_params)
    redirect_to profession_path(@profession)
  end

  def index

    @profession = Profession.find(params[:profession_id])
    @role = @profession.roles

    respond_to do |format|
      format.html
      format.csv { send_data @roles.to_csv }
      format.xls { send_data @roles.to_csv(col_sep: "\t") }
    end
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
    redirect_to profession_role_path(@profession, @role)
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

  def import
    Role.import(params[:file])
    redirect_to profession_roles_path, notice: "Roles updated"
  end

  def role_params
    params.require(:role).permit(:name, :tag_list) ## Rails 4 strong params usage
  end

  private
    def role_params
      params.require(:role).permit(:name, :description, :profession_id, :tag_list, :condition_ids => [], :job_ids => [])
    end
end
