module ApplicationHelper
  def body_tags
    klasses = ''
    klasses << " #{controller.controller_name}" unless
                    klasses.match(/#{controller.controller_name}/)
    return { :class => klasses,
             :id    => controller.action_name,
             :role  => "body" }
  end

end
