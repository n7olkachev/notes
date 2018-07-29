module Notes
    module ApplicationContract
        abstract def add_note(content : Strong)
    end

    class Application
        include ApplicationContract
        
        protected getter home_dir : String
        
        def initialize(@home_dir)
        end

        def add_note(content : String)
            ensure_home_dir_exists
            File.write(home_path(Time.now.to_s("%Y-%m-%dT%H:%M:%S.txt")), content)
        end

        protected def ensure_home_dir_exists
            Dir.mkdir_p(home_dir)
        end

        protected def home_path(path : String)
            "#{home_dir}/#{path}"
        end
    end
end