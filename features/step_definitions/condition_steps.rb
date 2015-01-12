When(/^I click a condition$/) do
  condition = Condition.first
  find("a", :text => "#{condition.name}").click
end
