class SuggestionsController < ApplicationController
  def create
    @profession = Profession.find(params[:profession_id])

    @role = Role.find(params[:role_id])
    @suggestion = @role.suggestions.create(suggestion_params)
    redirect_to profession_role_path(@profession, @role)
  end

  private
    def suggestion_params
      params.require(:suggestion).permit(:suggester, :description, :jobs, :sources)
    end

end
