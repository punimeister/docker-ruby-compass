# punimeister/ruby-compass

[![Docker Stars](https://img.shields.io/docker/stars/punimeister/ruby-compass.svg)](https://hub.docker.com/r/punimeister/ruby-compass/)
[![Docker Pulls](https://img.shields.io/docker/pulls/punimeister/ruby-compass.svg)](https://hub.docker.com/r/punimeister/ruby-compass/)
[![Docker Automated](https://img.shields.io/docker/automated/punimeister/ruby-compass.svg)](https://hub.docker.com/r/punimeister/ruby-compass/)
[![Docker Build](https://img.shields.io/docker/build/punimeister/ruby-compass.svg)](https://hub.docker.com/r/punimeister/ruby-compass/)

## Source Code

### [ruby-compass:latest](https://github.com/punimeister/docker-ruby-compass/tree/master/latest)

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
