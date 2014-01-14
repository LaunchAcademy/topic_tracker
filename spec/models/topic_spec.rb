require 'spec_helper'

describe Topic do
  let(:blanks) {["", nil]}
  it { should have_many :votes }
  it {should belong_to :user}
  it {should_not have_valid(:title).when(*blanks)}
  it {should_not have_valid(:description).when(*blanks)}
end

