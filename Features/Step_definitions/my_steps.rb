#DO NOT CHANGE ANY STEP DEFINTIONS IN THIS FILE.

require_relative '../../Features/Support/env'
require 'cucumber'

When(/^I tap on identifier "([^"]*)"$/) do |arg|
  touch_with_id(arg)
end


Then(/^I check if element with identifier "([^"]*)" exists is true\?$/) do |arg|
  assert_if_true_with_id(arg)
end


Then(/^I enter "([^"]*)" in the identifier "([^"]*)"$/) do |arg1, arg2| 
  enter_text_with_id(arg1,arg2)
end


Then(/^I assert for element "([^"]*)"$/) do |arg|
  assert_with_id(arg)
end

And(/^I long press on x "([^"]*)" y "([^"]*)" for duration "([^"]*)"$/) do |arg1, arg2, arg3|
  Appium::TouchAction.new.press(x: arg1, y: arg2).wait(arg3).release.perform
end


And(/^I swipe "([^"]*)"$/) do |arg|
  swipe_screen(arg)
end


And(/^I scroll "([^"]*)"$/) do |arg|
  scroll_screen(arg)
end


And(/^I print the page source$/) do
  puts $driver.get_source
end

Given(/^I launch the application with package name "([^"]*)" and apkname "([^"]*)" and with alert status "([^"]*)"$/) do |arg1, arg2, arg3|
  start_app(arg1,arg2,arg3)
end

Then(/^with xpath I assert for identifier "([^"]*)"$/) do |arg|
  assert_with_xpath(arg)
end


And(/^with xpath I tap on identifier "([^"]*)"$/) do |arg|
  tap_with_xpath(arg)
end


And(/^with xpath I enter "([^"]*)" in identifier "([^"]*)"$/) do |arg1, arg2|
  enter_text_with_xpath(arg2,arg1)
end

And(/^I go back$/) do
  go_back
end


And(/^I background the application for duration "([^"]*)" seconds$/) do |arg|
  backgroundApp(arg)
end

And(/^I reboot the device$/) do
  reboot
end

And(/^I execute adb command "([^"]*)"$/) do |arg|
  execute_command(arg)
end