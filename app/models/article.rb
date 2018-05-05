# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  published  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ApplicationRecord
    validates :title, presence: true 

    scope :published, -> {where(published: true)}
    #def self.published
    #    where(published: true)
    #end
    
    def word_count
        self.body.split(" ").count
    end

end
