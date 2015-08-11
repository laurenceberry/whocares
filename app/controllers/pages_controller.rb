class PagesController < ApplicationController
  def index

  end
  def search_results
    if params[:search]
      @roles = Role.search(params[:search]).order("created_at DESC")
    else
      nil
    end
  end
end
