require "./notes/*"

app = Notes::Application.new(ENV["NOTES_HOME_DIR"]? || "#{ENV["HOME"]}/.notes")

cli = Notes::Cli.new(app)
cli.handle ARGV