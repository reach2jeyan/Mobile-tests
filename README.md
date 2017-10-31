# README #

Please read the contents below before starting to use.

### What is this repository for? ###

1. This repository is for maintaining the basic framework to be downloaded for writing tests for mobile automation
2. Please DO NOT EDIT, `env.rb`, `hooks.rb`, `steps_defintions.rb`, `rakefile` and `cucumber.yml`. These help us in running the builds on the Jenkins server.
3. Use this framework to start writing gherkin scenarios for tests of the respective project

### How do I get set up? ###

* You will need to set up Appium, Ruby, Android-sdk, xcode in order to run the tests in this framework.
* Install Xcode
* Install brew with `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
* Install Android sdk with the following commands. Please note that, these commands are to be executed in series. DO NOT SKIP.
   
   `brew tap caskroom/cask`
   
   `brew cask install android-sdk`
* After installing Android-sdk, Copy/Paste these notes in the `.bash_profile`. See if you already have `bash_profile` by typing `open -e bash_profile`. If you dont, create one by `touch .bash_profile` and execute `open` command
* Copy these to bash_profile, and save it. Then type `source .bash_profile`. Open a new terminal after completion.
   
   `export ANDROID_HOME=/usr/local/Caskroom/android-sdk/`
   `export PATH=$ANDROID_HOME/platform-tools:$PATH`
   `export PATH=$ANDROID_HOME/tools:$PATH`
	 
	 
* Download Appium from Appium.io and install it. Usage of appium has been mentioned in the confluence. Please follow those procedures.
* Install ruby with brew by executing `brew install ruby`.
* Install node with brew by executing `brew install node`.
* Type `ruby -v` to know if you are using the latest ruby version `2.4.0` and above.
* Execute the `gem install` command for the gems present in the `Gemfile.lock`. For example, to install cucumber `gem install cucumber`
* Perform a `sudo gem install bundler` and `bundle install`

XCUI Tests:
Current version of Appium(1.7.0) onwards has the inbuilt capability to run and compile the `wda` while running appium and hence you dont have to manually launch the `wda` through xcode. However, please ensure all these are installed and configured before launching appium tests in XCUI.

`brew install libimobiledevice --HEAD`
            
`brew install ideviceinstaller`

`brew install carthage`

`npm install -g ios-deploy`

`gem install xcpretty`


### Issues ###

*Fork and raise a pull request if you feel there are major issue with the code. 

### Who do I talk to? ###

*Contact repo owner if you want to have additional information to debug.