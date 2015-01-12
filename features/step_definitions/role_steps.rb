When(/^I click a role$/) do
  role = Role.first
  find("a", :text => "#{role.name}").click
end
