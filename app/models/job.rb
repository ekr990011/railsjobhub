class Job < ApplicationRecord
  mount_uploader :logo, LogoUploader
end
