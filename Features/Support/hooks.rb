# Here we will have all definitions of
# hooks that we want running around, before or after scenarios

# Before everything - do setup here
# The intents are aggregated here, and then run on a separate 'Before' block at the bottom of this file
# DO NOT WRITE ANY 'Before' HOOKS IN THE LINES OF THIS FILE BEFORE THE BLOCK BELOW.

Before do
  if  $driver.device_is_android?
    puts "Device connected is Android"
  end
end


Before do |scenario|
  app_hash = {
      app_package: '',
      app_activity: ''
  }
  appium_device.start_activity app_hash
end

After do |scenario|
  system('adb shell am {packagename}')
end


Before do |scenario|
  clear_logs
end


After do |scenario|
  if scenario.failed?
    logsandscreenshot
  end
end

at_exit do
  $driver.driver_quit  #Stop the appium driver after the tests, this will reduce session override
  #Create a device information json file to capture details about the device on which the test is run
  deviceInfo_Hash = {
      "PLATFORM" =>  "Android",
      "DEVICE_VERSION" => system('adb shell getprop | grep build.version.release'),
      "DEVICE_MODEL" =>  system('adb devices -l'),
      "APP_VERSION"  =>  system('adb shell dumpsys package my.package | grep versionName'),
  }
  File.open("deviceinfo.json","w") do |f|     #Write the hashtable information to a json file.
    f.write(deviceInfo_Hash.to_json)
    embed_device_info(deviceInfo_Hash)
  end
end

def clear_logs
  system('adb logcat -c')
end

def embed_logs(file_name)
  embed("#{file_name}", 'text/plain', 'Logs')
end

def embed_screenshot(file_name)
  embed("#{file_name}", 'image/png', 'Scenario Failed Screenshot')
end

def elements_exist?(values)
  values = [*values]

  doc = get_page_source

  values.each { |value| return value if doc =~ /#{field}=\"#{value}\"/ }
  false
end

def embed_device_info(file_name)
  deviceInfo_Hash = {
      "PLATFORM" =>  "Android",
      "DEVICE_VERSION" => system('adb shell getprop | grep build.version.release'),
      "DEVICE_MODEL" =>  system('adb devices -l'),
      "APP_VERSION"  =>  system('adb shell dumpsys package my.package | grep versionName'),
  }
end

def logsandscreenshot
  sname = (0...8).map { (65 + rand(26)).chr }.join
  log_file = (0...8).map { (65 + rand(26)).chr }.join
  appium_device.driver.save_screenshot(sname)
  embed_screenshot(sname)
  system("adb logcat -t 1000 > #{log_file}")   # Put last 1000 lines of logs in the log file
  embed_logs(log_file)
end