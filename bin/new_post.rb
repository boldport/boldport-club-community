#!/usr/bin/env ruby
require "pathname"

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

def get_post_title
  ARGV.last || "New Post"
end

def get_post_date
  if ARGV.count > 1
    ARGV.first
  else
    Time.now.strftime("%Y-%m-%d")
  end
end

def get_post_date_time
  actual = Time.now.to_s.split
  actual[0] = get_post_date
  actual.join(" ")
end

def get_post_filename
  parts = [get_post_date]
  title = get_post_title
  parts.concat title.downcase.split
  parts.join("-") + ".md"
end

def generate_post
  post_title = post_title
  post_date_time = get_post_date_time
  puts

  root_path = Pathname.new(File.dirname(__FILE__)).join('..')
  template_full_path = root_path.join('_drafts', 'template.md')
  post_full_path = root_path.join('_posts', get_post_filename)

  puts <<-EOS
  Preparing a new post #{get_post_filename}

  title:    #{post_title}
  date:     #{post_date_time}
  template: #{template_full_path}

  Draft is now available here for editing: #{post_full_path}

  EOS

  template_text = File.open(template_full_path, 'rb') { |f| f.read }
  template_text.gsub!(/title:.*$/, %{title:       "#{get_post_title}"})
  template_text.gsub!(/date:.*$/, %{date:        "#{post_date_time}"})

  File.open(post_full_path, 'w') {|f| f.write(template_text) }
end

ARGV.count > 0 ? generate_post : help
