class LinkSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :votes, :downvotes
end
