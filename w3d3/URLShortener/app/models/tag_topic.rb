class TagTopic < ActiveRecord::Base
  validate :topic, presence: true
end
