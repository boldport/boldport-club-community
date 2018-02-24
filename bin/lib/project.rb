require "pathname"

class Project
  attr_accessor :project_key

  def initialize(project_key)
    self.project_key = project_key
  end

  def root_path
    Pathname.new(File.dirname(__FILE__)).join('..', '..')
  end

  def short_name
    project_key.split('-')[1..-1].collect(&:capitalize).join(' ')
  end

  def short_key
    project_key.split('-')[1..-1].join('-').downcase
  end

  def project_number
    project_key.split('-').first.gsub(/\D/, '').to_i
  end

  def title
    "#{short_name} (Project ##{project_number}, TBD)"
  end

  def project_folder
    root_path.join('projects').join(project_key)
  end

  def index_file
    project_folder.join('index.html')
  end

  def generate!
    Dir.mkdir(project_folder) unless Dir.exist?(project_folder)
    File.open(index_file, 'w') {|f| f.write(render_index_body) }
  end

  def render_index_body
    return <<-EOS
---
layout: project
project: #{project_key}
short_name: #{short_name}
title: "#{title}"
# shop_page: http://www.boldport.club/shop/product/tbd
# product_page: http://www.boldport.club/#{short_key}
# osh_files: https://github.com/boldport/#{short_key}
hero_image:
---
    EOS
  end

end
