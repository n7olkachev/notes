require "./notes/*"

repository = Notes::FileRepository.new(ENV["NOTES_HOME_DIR"]? || "#{ENV["HOME"]}/.notes")
app = Notes::Application.new(repository)

cli = Notes::Cli.new(app)
cli.handle ARGV