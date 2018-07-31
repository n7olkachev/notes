module Notes
    module RepositoryContract
        abstract def save(note : Note)
    end

    class FileRepository
        include RepositoryContract

        protected getter home_dir : String

        def initialize(@home_dir)
        end

        def save(note : Note)
            ensure_home_dir_exists
            File.write(home_path(note.createdAt.to_s("%Y-%m-%dT%H:%M:%S.txt")), note.content)
        end

        def home_path(path : String)
            "#{home_dir}/#{path}"
        end

        protected def ensure_home_dir_exists
            Dir.mkdir_p(home_dir)
        end
    end
end