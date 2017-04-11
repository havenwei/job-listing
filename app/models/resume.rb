class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job

  validates :name, presence: true
  validates :content, presence: true
  validates :attachment, presence: true

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

end
