class Vote < ApplicationRecord
  belongs_to :votable
  belongs_to :user
end
