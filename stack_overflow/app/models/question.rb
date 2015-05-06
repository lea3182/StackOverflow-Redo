class Question < ActiveRecord::Base
  has_many :answers

  def upvotes
    self.votes += 1
    self.save
  end

  def downvotes
    self.votes -= 1
    self.save
  end
end
