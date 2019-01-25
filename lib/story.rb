require 'json'
require 'date'

class Story
  attr_reader :section, :subsection, :title, :abstract, :link, :published, :photo

  def initialize(index)
    @section = story_parser[index]["section"]
    @subsection = story_parser[index]["subsection"]
    @title = story_parser[index]["title"]
    @abstract = story_parser[index]["abstract"]
    @link = story_parser[index]["url"]
    @published = Date.parse(story_parser[index]["published_date"]).strftime("%A %B %d, %Y")
    @photo = normal_photo(index)
  end

  def story_parser
    stories = File.read('data/nytimes.json')
    story_hash = JSON.parse(stories)
    story_hash["results"]
  end

  def normal_photo(index)
    photo_array = story_parser[index]["multimedia"]
    normal_photo = photo_array.find do |result|
      result["format"] if result["format"] == "Normal"
      end
    if normal_photo
      normal_photo["url"]
    else
      "No Photo Available"
    end
  end

end
