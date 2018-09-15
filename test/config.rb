css_dir = "assets/css"
sass_dir = "assets/scss"
output_style = :compressed
line_comments = false

require 'autoprefixer-rails'
on_stylesheet_saved do |file|
  css = File.read(file)
  File.open(file, 'w') do |io|
    io << AutoprefixerRails.process(css)
  end
end
