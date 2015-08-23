module ApplicationHelper
  include TweetButton

  TweetButton.default_tweet_button_options = {:via => "whocaresapp", :count => "horizontal", :text => ""}

  def data_exists?(data)
    if data
     data
    else
      "Help improve the information about this role."
    end
  end

  def role_name
    if @role
      if @role.description.blank?
        "Do you know about what #{@role.name + "s"} do?"
      else
        "Take a look at  #{@role.name} on the Who Cares app"
      end
    else
      "The Who Cares app, the people who care in the NHS"
    end
  end

  def role_description
    if @role
      if @role.description.blank?
        "Can you tell us about #{@role.name + "s"}?"
      else
        truncate(@role.description, length: 95)
      end
    else
      "Clear descriptions of the people who care in the NHS, what they do, and how they fit into the system."
    end
  end

  def body_tags
    klasses = ''
    klasses << " #{controller.controller_name}" unless
                    klasses.match(/#{controller.controller_name}/)
    return { :class => klasses,
             :id    => controller.action_name,
             :role  => "body" }
  end

  def global_navigation
    content_tag(:ul) do
      concat link_to('Who Cares?', root_path, :class => "logo")
      concat sign_in_out
      concat pages_links
    end
  end

  def sign_in_out
    if signed_in?
      content_tag(:li) do
        link_to('Sign out', destroy_admin_session_path, :method => :delete)
      end
    else
      # content_tag(:li) do
      #   link_to('Sign in', new_admin_session_path)
      # end
    end
  end

  def pages_links
    content_tag(:li) do
      content_tag(:a, 'Contact', :href => contact_path)
    end
  end

  def controls
    if signed_in?
      render partial: "shared/controls"
    end
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
