class Location < ApplicationRecord
  belongs_to :parent, :class_name => "Location", :foreign_key => "parent_id", optional: true
end
