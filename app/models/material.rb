include AutoHtml

class Material < ActiveRecord::Base
  has_and_belongs_to_many :lessons

  attr_accessible :content_type, :detail_content, :embedded_content, :stored, :user_id, :lesson_ids
  has_attached_file :stored
  validates_presence_of :content_type, :user_id
  validates_inclusion_of :content_type, :in => 1..3


  before_save :check_correct_values

  def check_correct_values
    ## rich text
    if self.content_type == 1
      if self.detail_content.nil?
        return false
      end
    end
    if self.content_type == 2
      if self.embedded_content.nil?
        return false
      end
    end
    if self.content_type == 3
      if self.stored.nil?
        return false
      end
    end
  end

  def self.material_by_user(user_id)
    return Material.where("user_id = ?", user_id).order("updated_at DESC")
  end

  def html_version
    return auto_html(self.detail_content){ youtube(:width => 200, :height => 150);simple_format; link(:target => 'blank');  }
  end
end
