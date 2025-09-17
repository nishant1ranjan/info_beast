class Blog < ApplicationRecord
  belongs_to :admin
  belongs_to :admin, optional: true
  has_rich_text :content
end
