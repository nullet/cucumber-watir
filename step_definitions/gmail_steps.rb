require 'watir'
require "watir-webdriver"
require "rspec/expectations"

Given /^I am at gmail$/ do
  @browser ||= Watir::Browser.new :firefox
  @browser.goto "gmail.com"
end

And /^I enter "([^"]*)" into the username field$/ do |username|
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
  recipients.set("truckas4urus@gmail.com")
  2.times { recipients.send_keys :tab }
end

Then /^I type a subject$/ do
  @browser.send_keys("Watir")
end

Then /^I write my email$/ do
  
end

Then /^I click on the first email$/ do
  email = @browser.table(:index => 5)[0][5]
  email.click
end

Then /^I close the browser$/ do 
  @browser.close
end

=begin
  This code works, but obviously you'll need to substitute valid
  credentials for it to do so.

  Not counting some struggles I had with installation, this challenge
  took me about 45-50 minutes to complete. After figuring out syntax,
  the bulk of my time was spent figuring out how to select the email 
  I want - primarily because I had some trouble selecting the appropriate
  table without any reliable classes or IDs.

  Also, sorry about the utter lack of commit history - just found out
  at the end that I should submit via Github.
=end