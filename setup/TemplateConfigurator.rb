require 'fileutils'
require 'colored2'

module Pod
    class TemplateConfigurator
        
        attr_reader :pod_name, :pod_languge, :pods_for_podfile, :prefixes, :user_name, :user_email
        
        #初始化方法
        def initialize(pod_name, pod_languge)
            @pod_name = pod_name
            @pod_languge = pod_languge
            @pods_for_podfile = []
            @prefixes = []
            @message_bank = MessageBank.new(self)
        end
        
        #运行主程序
        def run
            @message_bank.welcome_message
            
            generate_languge_project
            replace_variables_in_files
            case pod_languge.downcase.to_sym
                when :swift
                swift_replace_variables_in_sources_files
                swift_rename_sources_files
            end
            clean_template_files
            customise_prefix
            rename_spec_files
            reinitialize_git_repo
            run_pod_install
            
            @message_bank.farewell_message
        end
        
        #-------------------定义对象方法---------------------#
        
        #生成指定语言项目
        def generate_languge_project
            case pod_languge.downcase.to_sym
                when :swift
                ConfigureSwift.perform(configurator: self)
                when :objc
                ConfigureOC.perform(configurator: self)
            end
        end
        
        #运行pod install
        def run_pod_install
            puts "\nRunning " + "pod install".magenta + " on your new library."
            puts ""
            
            Dir.chdir("Example") do
                system "pod install"
            end
        end
        
        #删除废弃文件
        def clean_template_files
            ["configure", "templates", "setup", "screenshots"].each do |asset|
                `rm -rf #{asset}`
            end
        end
        
        #替换文件中的变量内容
        def replace_variables_in_files
            file_names = ['LICENSE', 'README.md', 'NAME.podspec', 'NAMEOC.podspec', 'Example/Podfile']
            file_names.each do |file_name|
                text = File.read(file_name)
                text.gsub!("${POD_NAME}", @pod_name)
                text.gsub!("${REPO_NAME}", @pod_name.gsub('+', '-'))
                text.gsub!("${USER_NAME}", user_name)
                text.gsub!("${USER_EMAIL}", user_email)
                text.gsub!("${YEAR}", year)
                text.gsub!("${DATE}", date)
                File.open(file_name, "w") { |file| file.puts text }
            end
        end
        
        #替换Sources资源当中的变量内容
        def swift_replace_variables_in_sources_files
            file_names = ['Sources/Util/Target.swift', 'Sources/Util/Util.swift', 'Sources/ViewModel/ViewModel.swift', 'Sources/Controller/ViewController.swift']
            file_names.each do |file_name|
                text = File.read(file_name)
                text.gsub!("${POD_NAME}", @pod_name)
                text.gsub!("${REPO_NAME}", @pod_name.gsub('+', '-'))
                text.gsub!("${USER_NAME}", user_name)
                text.gsub!("${USER_EMAIL}", user_email)
                text.gsub!("${YEAR}", year)
                text.gsub!("${DATE}", date)
                File.open(file_name, "w") { |file| file.puts text }
            end
        end
        
        #重命名Sources资源当中的文件名
        def swift_rename_sources_files
            File.rename("Sources/Util/Target.swift", "Sources/Util/" + @pod_name + "Target.swift")
            File.rename("Sources/Util/Util.swift", "Sources/Util/" + @pod_name + "Util.swift")
            File.rename("Sources/ViewModel/ViewModel.swift", "Sources/ViewModel/" + @pod_name + "ViewModel.swift")
            File.rename("Sources/Controller/ViewController.swift", "Sources/Controller/" + @pod_name + "ViewController.swift")
        end
        
        #自定义前缀
        def customise_prefix
            prefix_path = "./Tests/Tests-Prefix.pch"
            return unless File.exists? prefix_path
            
            pch = File.read prefix_path
            pch.gsub!("${INCLUDED_PREFIXES}", @prefixes.join("\n  ") )
            File.open(prefix_path, "w") { |file| file.puts pch }
        end
        
        #podspec文件重命名
        def rename_spec_files
            case pod_languge.downcase.to_sym
                when :swift
                File.rename("NAME.podspec", @pod_name + ".podspec")
                `rm -rf NAMEOC.podspec`
                when :objc
                File.rename("NAMEOC.podspec", @pod_name + ".podspec")
                `rm -rf NAME.podspec`
            end
        end
        
        #重新Git初始化
        def reinitialize_git_repo
            `rm -rf .git`
            #`git init`
            #`git add -A`
        end
        
        #-------------------定义对象变量---------------------#
        
        def user_name
            (ENV['GIT_COMMITTER_NAME'] || github_user_name || `git config user.name` || `<GITHUB_USERNAME>` ).strip
        end
        
        def github_user_name
            github_user_name = `security find-internet-password -s github.com | grep acct | sed 's/"acct"<blob>="//g' | sed 's/"//g'`.strip
            is_valid = github_user_name.empty? or github_user_name.include? '@'
            return is_valid ? nil : github_user_name
        end
        
        def user_email
            (ENV['GIT_COMMITTER_EMAIL'] || `git config user.email`).strip
        end
        
        def year
            Time.now.year.to_s
        end
        
        def date
            Time.now.strftime "%Y/%m/%d"
        end
        
    end
end
