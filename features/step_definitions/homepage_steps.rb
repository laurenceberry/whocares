module HomepageSH

  def should_see_navigation_links
    should have_css("a[href='#{professions_path}']")
    should have_css("a[href='#{tags_path}']")
    should have_css("a[href='#{conditions_path}']")
  end

end

World HomepageSH


When(/^I visit the homepage$/) do
  visit('/')
end

Then(/^I should see links to navigate by$/) do
  should_see_navigation_links
end
