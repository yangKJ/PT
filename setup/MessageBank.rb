module Pod
  class MessageBank
    attr_reader :configurator

    #初始化
    def initialize(config)
      @configurator = config
    end

    def show_prompt
      print " > ".green
    end

    def yellow_bang
      "! ".yellow
    end

    def green_bang
      "! ".green
    end

    def red_bang
      "! ".red
    end

    #运行终端命令
    def run_command command, output_command=nil
      output_command ||= command
      puts "  " + output_command.magenta
      system command
    end

    #进入Xcode工程创建欢迎页面
    def welcome_message
      puts ""
      puts "--------------all config started--------------".yellow
      puts ""
    end

    #打开Xcode工程
    def farewell_message
      puts ""
      puts "--------------all config finished--------------".yellow
      puts ""
      puts " Ace! you're ready to go!"
      puts " We will start you off by opening your project in Xcode"
      pod_name = @configurator.pod_name
      run_command "open 'Example/#{pod_name}.xcworkspace'", "open '#{pod_name}/Example/#{pod_name}.xcworkspace'"
    end
  end
end
