#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require "project"

def help
  puts <<-EOS

  A simple script to initialise a new project using the standard post template.

  Usage:

  $ ruby bin/new_project.rb p25-cordwood-three

  EOS
end

def project_key
  ARGV.first if ARGV.count == 1
end


def generate_project
  project = Project.new project_key

  puts <<-EOS

  Preparing a new project

  key: #{project.project_key}
  folder: #{project.project_folder}

  EOS
  project.generate!

end

if project_key
  generate_project
else
  help
end
