require "watir-webdriver"
require "rspec/expectations"

Given /^I am at gmail$/ do
  @browser ||= Watir::Browser.new :firefox
  @browser.goto "gmail.com"
end

And /^I enter "([^"]*)" into the username field$/ do |username|
  @username = username
  @browser.text_field(:id => "Email").set username
end

Then /^I click on element having id "([^"]*)"$/ do |id|
  @browser.element(:id => id).click
end

And /^I wait ([^"]*) sec$/ do |time|
  sleep time.to_i
end

And /^I enter "([^"]*)" into the password field$/ do |password|
  @browser.text_field(:id => "Passwd").set password
end

Then /^I click the compose button$/ do
  @browser.div(:class => "z0").div.click
end

Then /^I type my own address in the recipient bar$/ do
  recipients = @browser.textarea(:index => 0)
  recipients.set(@username + "@gmail.com")
  2.times { recipients.send_keys :tab }
end

Then /^I type a subject$/ do
  @browser.send_keys("Watir")
end

Then /^I write my email$/ do
  @browser.send_keys :tab
  @browser.send_keys "Hello world"
end

Then /^I hit send$/ do
  @browser.send_keys :tab
  @browser.send_keys :enter
end

Then /^I reload my inbox$/ do
  @browser.refresh
end

Then /^I click on the first email$/ do
  email = @browser.table(:index => 5)[0][5]
  email.click
end

Then /^I check to make sure I clicked the right email$/ do
  if @browser.text.include?("Watir") && @browser.text.include?("Hello world")
    @result = true
  else
    @result = false
  end
end

Then /^I close the browser$/ do 
  @browser.close
end

Then /^I close my browser$/ do 
  if @result == true
    puts "Looks like everything ran properly!"
  else
    puts "Looks like something didn't quite go right."
  end
  @browser.close
end