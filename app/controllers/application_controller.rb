class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def current_ability
    if current_admin
      @current_ability ||= Ability.new(current_admin)
    elsif current_contributor
      @current_ability ||= Ability.new(current_contributor)
    else
      @current_ability ||= Ability.new(current_contributor)
    end
  end

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
end
