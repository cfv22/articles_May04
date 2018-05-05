# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  published  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "article is not created without a title" do 
    article = Article.new
    assert_not article.save, "article should not be created without a title"
  end
  
  test ".word_count returns the correct number of words" do
    article = Article.new(title: "Art 1", body: "Hola mundo, esto es una prueba!")
    assert_equal 6, article.word_count
  end
  
  test "published scope only returns published articles" do
    articles = Article.published
    assert_equal 1, articles.length
  end
end
