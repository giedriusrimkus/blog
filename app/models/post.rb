class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true
	acts_as_taggable_on :tags

	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged

	def slug_candidates
	  [[:id, :title]]
	end

	def should_generate_new_friendly_id?
		new_record?
	end

	def previous_post
  		self.class.first(:conditions => ["created_at < ?", created_at], :order => "created_at desc")
	end

	def next_post
  		self.class.first(:conditions => ["created_at > ?", created_at], :order => "created_at asc")
	end
end
