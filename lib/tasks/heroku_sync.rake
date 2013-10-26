# Synchronizes current filesystem back to heroku

namespace :heroku do
  desc "Synchronizes a repository to a heroku instance"
  task :sync => ['heroku:sync:clone', 'heroku:sync:files',
                 'heroku:sync:commit', 'heroku:sync:push']

  namespace :sync do
    # The application name. Hard coded for now..
    HerokuAppName = 'ancient-atoll-2193'

    # Temporary heroku clone directory
    HerokuDir = 'tmp/heroku'

    # Heroku host
    HerokuHost = 'heroku.com'

    desc "Clones (or pulls) heroku application repository to tmp/ heroku"
    task :clone do
      if FileTest.exist? HerokuDir
        Dir.chdir HerokuDir do
          raise "Could not pull #{HerokuDir}" unless system "git pull ."
        end
      else
        raise "Could not clone #{HerokuAppName}" unless
            system "git clone git@#{HerokuHost}:#{HerokuAppName}.git #{HerokuDir}"
      end
    end

    desc "Synchronizes difference between the current filesystem and the heroku clone"
    task :files do
      require 'find'
      require 'fileutils'
      #require 'ftools'

      def for_difference_between src_dir, dest_dir
        Dir.chdir(dest_dir) do
          Find.find(src_dir) do |src_path|
            path = src_path.sub(src_dir, '')
            next if path.empty?

            fdir, base = File.split(path)
            if base[0] == ?. or
                base =~ /^(?:CVS|bak)/i or
                fdir =~ /^(?:log|db|tmp)/i
              Find.prune
              next
            end

            case
              when !FileTest.exist?(path)
                yield :added, path
              when File.stat(src_path).ctime > File.stat(dest_dir + '/' + path).ctime
                yield :modified, path unless FileTest.directory? path  # Don't fire dir modification events
            end
          end
        end
      end

      from_dir = File.expand_path('.') + "/"
      to_dir = File.expand_path(HerokuDir) + "/"

      # Add / copy files and dirs that exist in source but not in target
      for_difference_between from_dir, to_dir do |event, path|
        from_path = from_dir + '/' + path
        to_path   = to_dir + '/' + path

        if FileTest.directory? from_path
          FileUtils.makedirs to_path
        else
          FileUtils.copy from_path, to_path
        end

        STDERR.puts "Adding #{path}"
        Dir.chdir(to_dir) do
          case event
          when :added
            system "git add #{path}"
          when :modified
            system "git add #{path}"  # Seems like git wants 'add' issued even for modifications
          end
        end
      end

      # Remove files / dirs that exist in taget but not in source
      for_difference_between to_dir, from_dir do |event, path|
        Dir.chdir(to_dir) do
          case event
          when :added
            if FileTest.directory?(to_dir + '/' + path)
              system "git rm -r #{path}"
            else
              system "git rm #{path}"
            end
          end
        end
      end

    end

    desc "Commits the changes"
    task :commit do
      Dir.chdir HerokuDir do
        raise "Could not commit #{HerokuDir}" unless
          system "git commit -m 'heroku:sync:files at #{Time.now}'"
            end
    end

    desc "Pushes the changes back to heroku repository"
    task :push do
      Dir.chdir HerokuDir do
        raise "Could not push #{HerokuAppName}" unless
            system "git push"
      end
    end
  end
end