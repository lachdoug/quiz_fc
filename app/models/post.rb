class Post < ApplicationRecord

  belongs_to :postable, polymorphic: true

  enum status: [ :draft, :published, :archived ]

  def to_s
    "Post #{ id }"
  end

end
