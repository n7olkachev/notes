module Notes
    module ApplicationContract
        abstract def add_note(content : Strong)
    end

    class Application
        include ApplicationContract

        protected getter repository : RepositoryContract
        
        def initialize(@repository)
        end

        def add_note(content : String)
            note = Note.new(content)
            repository.save(note)
        end
    end
end