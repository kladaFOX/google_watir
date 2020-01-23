require_relative '../pages/search_page.rb'

Given("a user goes to Google home page") do
  @google_page = SearchPage.new(@browser)
  @google_page.visit_google_site
end

When("a user search for {string}") do |keyword|
  @google_page.search_box_element.wait_until(&:present?)
  @google_page.enter_search_keyword(keyword)
  @google_page.click_search_button
end

Then ("google should return link on the {int} place with url = {string} and text = {string}.") do |place, url, text|
  expect(@google_page.search_right_place?(place, text, url)).to eql(true)
  #expect(@google_page.search_text_present?(text)).to eql(true)

  @google_page.close
end
