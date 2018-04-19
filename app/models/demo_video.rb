class DemoVideo < ApplicationRecord
  belongs_to :user
  has_attached_file :video
  validates_attachment :video, content_type: { content_type: ["video/mp4"] }
  validate :videos_count, :on => :create
  validate :video_size_validation, :if => "video?"

  def videos_count
    if self.user.demo_videos.size >= 3
      errors.add(:base, "Sorry you are already uploaded 3 demo videos")
    end
  end

  def video_size_validation
    errors[:video] << "should be less than 2MB" if video.size > 2.megabytes
  end
end
