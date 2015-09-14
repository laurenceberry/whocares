class ConditionsController < ApplicationController
  load_and_authorize_resource

  def index
    @conditions = Condition.all
    respond_to do |format|
      format.html
      format.csv { send_data @conditions.to_csv }
      format.xls { send_data @conditions.to_csv(col_sep: "\t") }
    end
  end

  def show
    @condition = Condition.find(params[:id])
  end

  def new
    @condition = Condition.new
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def create
    @condition = Condition.new(condition_params)

    if @condition.save
      redirect_to(conditions_path)
    else
      render 'new'
    end
  end

  def update
    @condition = Condition.find(params[:id])
    @condition.update_attributes(condition_params)
    redirect_to condition_path(@condition)
    return
  end

  def destroy
    @condition = Condition.find(params[:id])
    @condition.destroy

    redirect_to conditions_path
  end

  def import
    Condition.import(params[:file])
    redirect_to conditions_path, notice: "Conditions updated"
  end


  private
    def condition_params
      params.require(:condition).permit(:name, :description, :image, repeatables_attributes: [:id, :name, :content, :condition_id, :_destroy])
    end

end
