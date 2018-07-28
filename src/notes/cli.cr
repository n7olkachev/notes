module Notes
    class Cli
        protected getter app : Notes::Application

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
            content = options[0]
            app.add_note(content)
        end
    end
end