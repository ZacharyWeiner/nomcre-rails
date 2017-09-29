class CollectionItem < ApplicationRecord
  belongs_to :user
  belongs_to :collection
end
