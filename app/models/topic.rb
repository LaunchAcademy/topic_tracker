class Topic < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :description

    def vote_from(user)
    votes.find_by(user_id: user.id)
  end

  def has_vote_from?(user)
    votes.find_by(user_id: user.id).present?
  end

end
