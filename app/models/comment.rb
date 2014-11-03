class Comment < ActiveRecord::Base
	belongs_to :post
	validates :name, presence: true, length: {minimum: 5}
	validates :body, presence: true
end
