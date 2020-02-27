class ParticipationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :user_id

  attribute :twitter_address
  attribute :discord
  attribute :twitter_address

end
