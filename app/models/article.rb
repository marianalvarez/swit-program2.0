class Article < ActiveRecord::Base
	belongs_to :user
	 has_many :comments, dependent: :destroy
	 has_many :sweets
	 has_many :sours
	 
	 validates :title, presence: true,
                    length: { minimum: 5 }


     #acts_as_likeable
     #acts_as_votable
end
