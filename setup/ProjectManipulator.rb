require 'xcodeproj'

module Pod
    
    class ProjectManipulator
        attr_reader :configurator, :xcodeproj_path, :platform, :string_replacements, :prefix
        
        #类执行方法
        def self.perform(options)
            new(options).perform
        end
        
        #对象初始化
        def initialize(options)
            @xcodeproj_path = options.fetch(:xcodeproj_path)
            @configurator = options.fetch(:configurator)
            @platform = options.fetch(:platform)
            @prefix = options.fetch(:prefix)
        end
        
        #运行
        def run
            @string_replacements = {
                "PROJECT_OWNER" => @configurator.user_name,
                "TODAYS_DATE" => @configurator.date,
                "TODAYS_YEAR" => @configurator.year,
                "PROJECT" => @configurator.pod_name,
                "CPD" => @prefix
            }
            
            replace_internal_project_settings
            
            @project = Xcodeproj::Project.open(@xcodeproj_path)
            show_demo_project
            @project.save
            
            rename_files
            rename_project_folder
        end
        
        #打印demo工程
        def show_demo_project
            # Print the all groups
            @project.root_object.main_group.children.select { |group|
                puts "------------ #{group.name} ------------".green
            }
        end
        
        #工程目录
        def project_folder
            File.dirname @xcodeproj_path
        end
        
        #重命名所有的文件
        def rename_files
            # shared schemes have project specific names
            scheme_path = project_folder + "/PROJECT.xcodeproj/xcshareddata/xcschemes/"
            File.rename(scheme_path + "PROJECT.xcscheme", scheme_path +  @configurator.pod_name + ".xcscheme")
            # rename xcproject
            File.rename(project_folder + "/PROJECT.xcodeproj", project_folder + "/" +  @configurator.pod_name + ".xcodeproj")
            # change app file prefixes
            ["CPDAppDelegate.h", "CPDAppDelegate.m", "CPDViewController.h", "CPDViewController.m"].each do |file|
                before = project_folder + "/PROJECT/" + file
                next unless File.exists? before
                after = project_folder + "/PROJECT/" + file.gsub("CPD", prefix)
                File.rename before, after
            end
            # rename project related files
            ["PROJECT-Info.plist", "PROJECT-Prefix.pch", "PROJECT.entitlements"].each do |file|
                before = project_folder + "/PROJECT/" + file
                next unless File.exists? before
                after = project_folder + "/PROJECT/" + file.gsub("PROJECT", @configurator.pod_name)
                File.rename before, after
            end
        end
        
        #工程目录重命名
        def rename_project_folder
            if Dir.exist? project_folder + "/PROJECT"
                File.rename(project_folder + "/PROJECT", project_folder + "/" + @configurator.pod_name)
            end
        end
        
        #替换内部的工程配置
        def replace_internal_project_settings
            Dir.glob(project_folder + "/**/**/**/**").each do |name|
                next if Dir.exists? name
                text = File.read(name)
                for find, replace in @string_replacements
                    text = text.gsub(find, replace)
                end
                File.open(name, "w") { |file| file.puts text }
            end
        end
        
    end
    
end
