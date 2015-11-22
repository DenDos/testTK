class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :shortContent, presence: true
  validates :content, presence: true
  validates :shortContent, length: { minimum: 20, maximum: 200 }
  validates :content, length: { minimum: 50 }
  
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  
  acts_as_taggable
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  def self.search(search)
    if search
      where('category LIKE ?', "%#{search}%")
    else
      self.all
    end
  end
  
end
