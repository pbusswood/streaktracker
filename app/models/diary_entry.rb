class DiaryEntry < ActiveRecord::Base
	attr_accessible :title, :description, :mood	

	def self.allowed_types 
		['Happy', 'Sad', 'Angry', 'Delighted', 'Other']
	end

	validates :title, presence: true, uniqueness: true
	validates :description, presence: true
	validates :mood, presence: true, inclusion: { :in => DiaryEntry.allowed_types }

end

