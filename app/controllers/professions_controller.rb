class ProfessionsController < ApplicationController

  def index
    @professions = Profession.all
  end

  def show
    @profession = Profession.find(params[:id])
  end

  def new
    @profession = Profession.new
  end

  def edit
    @profession = Profession.find(params[:id])
  end

  def create
    @profession = Profession.new(profession_params)

    if @profession.save
      redirect_to @profession
    else
      render 'new'
    end
  end

  def update
    @profession = Profession.find(params[:id])
    @profession.update_attributes(profession_params)
    redirect_to(profession_path)
    return
  end

  def destroy
    @profession = Profession.find(params[:id])
    @profession.destroy

    redirect_to professions_path
  end

  private
    def profession_params
      params.require(:profession).permit(:name, :description)
    end

end
