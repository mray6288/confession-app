class ConfessionTopic < ApplicationRecord
	belongs_to :confession
	belongs_to :topic
end
