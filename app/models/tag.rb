class Tag < ActiveRecord::Base
  
  self.include_root_in_json = false

  has_many :resource_tags
  has_many :resources, :through => :resource_tags
 
  attr_accessible :name, :updated_at
  
  def have_same_tags_as? obj
    temp = false
    self.tags.each do |outer_tag|
      obj.tags.each do |inner_tag|
        temp = true if outer_tag.name == inner_tag.name
        break if temp
      end
      break if temp
    end
    temp
  end
  
  
  private
    def make_up_to_date
      self.tags.each {|tag| tag.updated_at = Time.now}
    end
end
