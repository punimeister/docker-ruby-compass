# Supported tags and respective `Dockerfile` links

- [`latest` (latest/Dockerfile)](https://github.com/punimeister/docker-ruby-compass/blob/master/latest/Dockerfile)

## Example

### Directory structure

```
.
├── assets
│   └── scss
│       └── styles.scss
├── config.rb
└── docker-compose.yml
```

### config.rb

```
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
```

### docker-compose.yml

```
version: '3'

services:

  ruby-compass:
    image: 'punimeister/ruby-compass'
    restart: 'on-failure'
    volumes:
      - './assets:/app/assets'
      - './config.rb:/app/config.rb:ro'
```
