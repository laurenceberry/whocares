class ProfessionsController < ApplicationController

  def index
    @professions = Profession.all
    respond_to do |format|
      format.html
      format.csv { send_data @professions.to_csv }
      format.xls { send_data @professions.to_csv(col_sep: "\t") }
    end
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
      redirect_to(professions_path)
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

  def import
    Profession.import(params[:file])
    redirect_to professions_path, notice: "Professions updated"
  end


  private
    def profession_params
      params.require(:profession).permit(:name, :description)
    end

end
