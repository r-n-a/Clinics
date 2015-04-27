class Clinic < ActiveRecord::Base
	
	mount_uploader :avatar, AvatarUploader
	belongs_to :user
	has_many :procedures, dependent: :destroy

	validates :name, presence: true, length: { maximum: 25 }
	validates :typec, presence: true, length: { maximum: 40 }
	validates :adress, presence: true, length: { maximum: 50 }
	#validates :tel, presence: true , length: { is: 15 }
	validates :zipcode, presence: true, length: { is: 6 }
	
end
