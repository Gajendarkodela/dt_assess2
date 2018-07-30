class Attachment < ApplicationRecord
	mount_uploader :file, FileUploader
    validates_presence_of :file

    belongs_to :property     
end
