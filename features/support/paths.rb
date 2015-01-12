# -*- encoding : utf-8 -*-
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home ?page/i
      root_path

    when /sign ?in page/
      sign_in_path

    when /sign ?up page/
      sign_up_path

    when /professions page/
      professions_path

    when /jobs page/
      tags_path

    when /conditions page/
      conditions_path

    when /condition page/
      condition = Condition.first
      condition_path(condition)

    when /job page/
      tag = ActsAsTaggableOn::Tag.first
      tag_path(tag)

    when /roles page/
      profession = Profession.first
      profession_roles_path(profession)

    when /role page/
      role = Role.first
      profession = Profession.first
      profession_role_path(profession, role)

    end
  end
end
World(NavigationHelpers)

