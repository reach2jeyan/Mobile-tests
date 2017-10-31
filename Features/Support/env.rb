#DO NOT CHANGE ANY VALUES IN THIS FILE


require "appium_lib"


def start_app(packagename,apkname,alertstatus)
  caps_config = { deviceName: "Samsung",
                  platformName: "Android",
                  Fullreset: "false",
                  Noreset: "true",
                  Platformversion: system('adb shell getprop | grep build.version.release'),
                  app: (File.join(File.dirname(__FILE__), apkname )),
                  Packagename: packagename,
                  newCommandTimeout: "3600",
                  autoGrantPermissions: "true",
                  autoAcceptAlerts: alertstatus,
                  appium_lib: { wait: 20,
                                debug: false

                  } }
  $opts={ caps: caps_config}
  setup
end


def setup
  Appium::Driver.new($opts)
  Appium.promote_appium_methods Object
  $driver.start_driver

  #Makes all appium_lib methods accessible from steps
  #Starts appium driver before the tests begin

end


def server_url
  'http://0.0.0.0:4723/wd/hub'
end

def touch_with_id(identifier)
  wait_true { find_element(id: identifier).click }
end

def assert_if_true_with_id(identifier)
  wait_true { find_element(id: identifier)}
end

def enter_text_with_id(text,identifier)
  wait_true { find_element(id: identifier).send_keys(text)}
end

def assert_with_id(identifier)
  wait_true { find_element(id: identifier)}
end

def swipe_screen(direction)
  execute_script 'mobile: swipe', direction: direction
end

def scroll_screen(direction)
  xecute_script 'mobile: scroll', direction: direction
end

def assert_with_xpath(identifier)
  wait_true {  find_element(:xpath, "//*[@value='#{identifier}']") }
end

def tap_with_xpath(identifier)
  wait_true {  find_element(:xpath, "//*[@value='#{identifier}']").click }
end

def enter_text_with_xpath(identifier,text)
  element = wait_true { exists {  find_element(:xpath, "//*[@value='#{identifier}']") } }
  element.send_keys(text)
end

def go_back
  $driver.back
end

def backgroundApp(duration)
  background_app duration
end

def reboot
  system('adb reset')
end

def execute_command(command)
  system(command)
end