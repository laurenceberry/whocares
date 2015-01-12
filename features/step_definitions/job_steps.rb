When(/^I click a job$/) do
  tag = ActsAsTaggableOn::Tag.first
  find("a", :text => "#{tag.name}").click
end

Then(/^I should see a link to the job$/) do
  tag = ActsAsTaggableOn::Tag.first
  should have_css("a", :text => "#{tag.name}")
end
