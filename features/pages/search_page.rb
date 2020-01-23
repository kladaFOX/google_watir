class SearchPage
  include PageObject

  text_field(:search_box, name: "q")
  button(:search, value: "Google Search")
  div(:search_results, id: "main")
  div(:link_div, class: "g")

  def visit_google_site
    @browser.goto 'https://www.google.com/'
  end

  def enter_search_keyword(search_key)
    self.search_box = search_key
  end

  def click_search_button
    search
  end

  def search_text_present?(search_key)
    search_results.include?(search_key)
  end

  def search_right_place?(place, search_key, url)
    place -= 1
    @browser.divs(:class => 'r').each_with_index do |div, i|
      flag = false
      if i == place
        flag = true if div.a(:href => url).exists? and div.h3(:text => search_key).exists?
        return flag
      end
      flag
    end
  end

  def close
    @browser.close
  end
end
