class Link < ApplicationRecord
	mount_uploader :file,FileUploader
	belongs_to :test_case
end
