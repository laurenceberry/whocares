class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @roles = Role.tagged_with(@tag.name)
    @tags = Role.tag_counts_on(:tags)

  end
end
