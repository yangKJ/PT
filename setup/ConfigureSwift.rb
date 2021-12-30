module Pod

  class ConfigureSwift
    attr_reader :configurator

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform
      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/swift/Example/PROJECT.xcodeproj",
        :platform => :ios,
        :prefix => ""
      }).run

      # There has to be a single file in the Classes dir
      # or a framework won't be created
      #`touch Sources/ReplaceMe.swift`

      `mv ./templates/swift/* ./`

    end
  end

end
