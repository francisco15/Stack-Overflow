class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true
  belongs_to :user

  def self.already_vote?(user_id, id, method)
    if method == "Question"
      votes = Question.find(id).votes
    else
      votes = Answer.find(id).votes
    end
    if votes.find_by(user_id: user_id) == nil
      false
    else
      true
    end
  end
  
  def self.destroy_vote?(user_id, id, method)
    if method == "Question"
      votes = Question.find(id).votes
    else
      votes = Answer.find(id).votes
    end
    votes.find_by(user_id: user_id).destroy 
  end
end
