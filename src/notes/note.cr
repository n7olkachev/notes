require "uuid"

module Notes
    class Note
        property id : UUID = UUID.random
        property content : String
        property createdAt : Time = Time.now

        def initialize(@content)
        end
    end
end