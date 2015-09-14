class ConditionRepeatablesController < ApplicationController
  before_action :set_condition_repeatable, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @condition_repeatables = ConditionRepeatable.all
    respond_with(@condition_repeatables)
  end

  def show
    respond_with(@pcondition_repeatable)
  end

  def new
    @condition_repeatable = ConditionRepeatable.new
    respond_with(@condition_repeatable)
  end

  def edit
  end

  def create
    @condition_repeatable = ConditionRepeatable.new(condition_repeatable_params)
    @condition_repeatable.save
    respond_with(@condition_repeatable)
  end

  def update
    @condition_repeatable.update(condition_repeatable_params)
    respond_with(@condition_repeatable)
  end

  def destroy
    @condition_repeatable.destroy
    respond_with(@condition_repeatable)
  end

  private
    def set_condition_repeatable
      @condition_repeatable = ConditionRepeatable.find(params[:id])
    end

    def condition_repeatable_params
      params.require(:condition_repeatable).permit(:name, :content, :condition_id)
    end
end
