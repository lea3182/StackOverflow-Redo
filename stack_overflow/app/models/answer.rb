class Answer < ActiveRecord::Base
  belongs_to :question

  def upvotes
    self.votes += 1
    self.save
  end

  def upvotes
    self.votes -= 1
    self.save
  end
end
