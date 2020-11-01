class Video < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates_presence_of :videoid, :title, :color

end
