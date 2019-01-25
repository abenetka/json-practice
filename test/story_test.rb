require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/story'

class StoryTest < Minitest::Test

  def test_the_story_exists
    story = Story.new(0)
    assert_instance_of Story, story
  end

  def test_it_has_attributes
    index = 0
    story = Story.new(index)

    expected_section = "U.S."
    expected_subsection = "Politics"
    expected_title = "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal"
    expected_abstract = "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help."
    expected_link = "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html"
    expected_published = "Thursday November 29, 2018"
    expected_photo = "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg"

    assert_equal expected_section, story.section
    assert_equal expected_subsection, story.subsection
    assert_equal expected_title, story.title
    assert_equal expected_abstract, story.abstract
    assert_equal expected_link, story.link
    assert_equal expected_published, story.published
    assert_equal expected_photo, story.photo
  end
end
