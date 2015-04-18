module UserStepsHelper
  def create_contributer
    Contributor.create({
      :email => 'contributor@whocares.com',
      :password => 'fred1234',
      :password_confirmation => 'fred1234'}
    )
  end

  def sign_in_as(user)
    user_type = user.class.name.underscore
    visit self.send("new_#{user_type}_session_path")
    fill_in "#{user_type}_email", with: @I.email
    fill_in "#{user_type}_password", with: @I.password
    click_button "Sign in"
  end
end
World(UserStepsHelper)

Given(/^I am a contributor$/) do
  @I = create_contributer
end

Given(/^I have signed in$/) do
  sign_in_as @I
end
