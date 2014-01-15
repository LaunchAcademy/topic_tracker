require 'spec_helper'

describe Vote do
  it { should belong_to :topic }
  it { should belong_to :user }
  it { should validate_presence_of :topic_id }
  it { should validate_presence_of :user_id }
  it { should validate_uniqueness_of(:user_id).scoped_to(:topic_id) }
end
