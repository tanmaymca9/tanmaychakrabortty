class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  enum role: {school: 0, teacher: 1 ,student: 2, vendor: 3}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook,:twitter,:google_oauth2]

  validates :role, presence: true

#   PASSWORD_FORMAT = /\A
#   (?=.{8,})          # Must contain 8 or more characters
#   (?=.*\d)           # Must contain a digit
#   (?=.*[a-z])        # Must contain a lower case character
#   (?=.*[A-Z])        # Must contain an upper case character
#   (?=.*[[:^alnum:]]) # Must contain a symbol
# /x

# validates :password, 
#   presence: true, 
#   format: { with: PASSWORD_FORMAT }, 
#   confirmation: true, 
#   on: :create  

  has_attached_file :profile_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :profile_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_attached_file :cover_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :cover_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_attached_file :document
  validates_attachment :document, :content_type => { :content_type =>["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf" "application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document"]}
  
  geocoded_by :address   # can also be an IP address

  after_validation :geocode       # auto-fetch coordinates

  has_many :overviews, as: :user
  has_many :courses
  has_many :scholarships
  has_many :placements
  has_many :cutoffs
  has_many :campus
  has_many :school_pictures
  has_many :school_videos
  has_many :school_informations
  has_many :pay_fees, as: :user
  has_many :sale_notes
  has_many :applied_schools
  has_many :users, through: :applied_schools
  has_many :pay_fee_to_teachers
  has_many :sell_books
  has_many :applied_teachers
  has_many :teacher_requires
  has_many :vendor_requires
  has_many :slots
  has_many :demo_videos
  # belongs_to :country
  # belongs_to :state

  def create_picture(images)
    images.each do |image|
      SchoolPicture.create(picture: image)
    end
  end

  # def address
  #   [city,pincode, address].compact.join(', ')
  # end


  def find_location
    loc = Geocoder.coordinates(self.address)
    if loc.present?
      self.update_attribute(:latitude, loc[0])
      self.update_attribute(:longitude, loc[1])
    end
  end


  def create_address
    self.addresses.destroy_all
    addresses.each do |address|
      adrs = self.addresses.create(address: address)
      adrs.find_location if adrs.address.present?
    end
  end



  # def self.search(search)
  #   #binding.pry
  #   if search
  #     User.where("city LIKE ? AND role = ?","%#{@@first_value[:city]}%","%#{@@first_value[:role]}").paginate(:per_page => 3, :page => params[:page])
  #   else
  #     User.all
  #   end
  # end

  def self.filter(filter)
    if filter
      where(degree_name: filter)
    end
  end

	def self.from_omniauth(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.role = "student"
    end
  end
end