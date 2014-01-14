class User < ActiveRecord::Base
  validates_presence_of :uid, :name, :provider
  validates_uniqueness_of :uid
  has_many :topics
  has_many :votes

  def self.find_or_create_from_auth_hash(auth_hash)
    where(auth_hash.slice("provider", "uid")).first || create_from_omniauth(auth_hash)
  end

  def self.create_from_omniauth(auth_hash)
    create! do |user|
      user.provider = auth_hash["provider"]
      user.uid = auth_hash["uid"]
      user.name = auth_hash["info"]["nickname"]
    end
  end
end
