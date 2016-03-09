class Link < ApplicationRecord
  IMAGE_FORMATS = %w(.jpg .gif .png)

  validates :url, presence: true
  validates :title, presence: true

  def self.hottest_first
    order("votes - downvotes DESC")
  end

  def upvote
    increment!(:votes)
  end

  def downvote
    increment!(:downvotes)
  end

  def score
    votes - downvotes
  end

  def image?
    url.end_with? *IMAGE_FORMATS
  end

end
