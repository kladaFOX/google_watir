Feature: Google test search
  Scenario: searching something and check specific link
    Given a user goes to Google home page
    When a user search for "ruby"
    Then google should return link on the 2 place with url = "https://en.wikipedia.org/wiki/Ruby_(programming_language)" and text = 'Ruby (programming language) - Wikipedia'.
