When(/^I click a profession$/) do
  profession = Profession.first
  find("a", :text => "#{profession.name}").click
end
