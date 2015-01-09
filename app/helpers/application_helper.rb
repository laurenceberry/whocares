module ApplicationHelper
  def body_tags
    klasses = ''
    klasses << " #{controller.controller_name}" unless
                    klasses.match(/#{controller.controller_name}/)
    return { :class => klasses,
             :id    => controller.action_name,
             :role  => "body" }
  end

  def professions_index_page
    controller.controller_name == "professions" && controller.action_name == "index"
  end

  def profession_show_page
    controller.controller_name == "professions" && controller.action_name == "show"
  end

  def role_show_page
    controller.controller_name == "roles" && controller.action_name == "show"
  end

end
