module ApplicationHelper
  include TweetButton
  
  TweetButton.default_tweet_button_options = {:via => "whocares", :count => "horizontal", :text => "Check out this role on @whocaresapp, your guide to who does what in the #NHS:"}
  
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

  def profession_roles_index_page
    controller.controller_name == "roles" && controller.action_name == "index"
  end

  def role_show_page
    controller.controller_name == "roles" && controller.action_name == "show"
  end

  def conditions_index_page
    controller.controller_name == "conditions" && controller.action_name == "index"
  end
 
end
