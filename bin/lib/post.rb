require "pathname"


class Post
  attr_accessor :id, :created_at, :title, :date_ymd
  attr_accessor :source_url
  attr_accessor :author_name, :author_url
  attr_accessor :body
  attr_accessor :images
  attr_accessor :youtube_ids

  def initialize(title=nil, date_ymd=nil, id=nil, created_at=nil)
    @id = id
    @created_at = created_at || Time.now
    @title = title || "New Post"
    @date_ymd = date_ymd || @created_at.strftime("%Y-%m-%d")
    @images = []
    @youtube_ids = []
  end

  def images?
    images.length > 0
  end

  def youtube_ids?
    youtube_ids.length > 0
  end

  def media?
    images? or youtube_ids?
  end

  def date_time
    actual = created_at.to_s.split
    actual[0] = date_ymd
    actual.join(" ")
  end

  def filename
    parts = [date_ymd]
    parts.concat (id || title).to_s.downcase.split
    parts.join("-") + ".md"
  end

  def root_path
    Pathname.new(File.dirname(__FILE__)).join('..', '..')
  end

  def template_full_path
    root_path.join('_drafts', 'template.md')
  end

  def template
    @template ||= File.open(template_full_path, 'rb') { |f| f.read }
  end

  def full_path
    root_path.join('_posts', filename)
  end

  def text
    @text ||= render_text
  end

  def render_text
    text = template.dup
    text.gsub!(/title:.*$/, %{title:       "#{title}"})
    text.gsub!(/date:.*$/,  %{date:        "#{date_time}"})
    if author_name
      text.gsub!(/author_name:.*$/, %{author_name: "#{author_name}"})
    end
    if author_url
      text.gsub!(/#?author_url:.*$/, %{author_url:  "#{author_url}"})
    end
    if source_url
      text.gsub!(/#?source_url:.*$/, %{source_url:  "#{source_url}"})
    end
    if youtube_ids?
      text.gsub!(/#?youtubeid:.*$/, %{youtubeid:  "#{youtube_ids.first}"})
    end
    if images?
      image_list = "images:\n"
      images.each do |image|
        image_list += "- #{image}\n"
      end
      text.gsub!(/[#]images:.*$/, image_list)
    end
    if body
      text = text[0..text.index('---', 4) + 3] + "\n" + body + "\n"
    end
    text
  end

  def write
    File.open(full_path, 'w') {|f| f.write(text) }
  end

  def exists?
    File.exists? full_path
  end

end
