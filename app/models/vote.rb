class Vote < ActiveRecord::Base

  belongs_to :topic
  belongs_to :user

  validates_presence_of :topic_id
  validates_presence_of :user_id
  validates_uniqueness_of :user_id, scope: [:topic_id]
end
