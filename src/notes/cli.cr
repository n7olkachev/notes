require "tempfile"
require "colorize"

module Notes
    class Cli
        protected getter app : Notes::ApplicationContract

        def initialize(@app)
        end

        def handle(options : Array(String))
            command = options.first?
            return unless command

            case command
            when "add"
                options.shift
                add options
            end
        end

        protected def add(options : Array(String))
            if options[0]? == "-m"
                content = options[1]
            else
                editor = ENV["EDITOR"]
                tmp_file = Tempfile.new "NEW_NOTE"
                system "#{editor} #{tmp_file.path}"
                content = File.read tmp_file.path
                tmp_file.delete
            end

            app.add_note(content)

            puts "Note added!".colorize(:green)
        end
    end
end