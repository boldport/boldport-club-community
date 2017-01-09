#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require "pathname"
require "post"

def help
  puts <<-EOS

  A simple script to initialise a new post using the standard post template.

  Usage:

  To create a new post for today:

  $ ruby bin/new_post.rb "My New Post Title"

  To create a back-dated post, provide a date in YYY-MM-DD format:

  $ ruby bin/new_post.rb "2016-09-08" "My New Post Title"


  EOS
end

def post_title
  ARGV.last || "New Post"
end

def post_date_ymd
  ARGV.first if ARGV.count > 1
end

def generate_post
  post = Post.new(post_title, post_date_ymd)

  puts <<-EOS

  Preparing a new post #{post.filename}

  title:    #{post.title}
  date:     #{post.date_time}
  template: #{post.template_full_path}

  New post is now available here for editing: #{post.full_path}

  EOS
  post.write

end

ARGV.count > 0 ? generate_post : help
