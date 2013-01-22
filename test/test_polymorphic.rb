require 'abstract_unit'

class TestPolymorphic < ActiveSupport::TestCase
  fixtures :users, :employees, :comments, :hacks, :posts, :versions
  
  def test_polymorphic_has_many
    comments = Hack.find('andrew').comments
    assert_equal 'andrew', comments[0].person_id
  end

  def test_polymorphic_composite_has_many
    versions = Post.find(1, 1).versions
    assert_equal Version.find(1, 'Post', 1), versions.first
  end

  def test_polymorphic_has_one
    first_comment = Hack.find('andrew').first_comment
    assert_equal 'andrew', first_comment.person_id
  end

  def test_has_many_through
    user = users(:santiago)
    article_names = user.articles.collect { |a| a.name }.sort
    assert_equal ['Article One', 'Article Two'], article_names
  end

  def test_polymorphic_has_many_through
    user = users(:santiago)
    assert_equal ['andrew'], user.hacks.collect { |a| a.name }.sort
  end
end
