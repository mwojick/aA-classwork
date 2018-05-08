# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint(8)        not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates :artwork_id, uniqueness: {scope: :viewer_id, 
    message: 'Only one viewer per art'}
    
    belongs_to :artwork
    
    belongs_to :viewer,
    class_name: :User
    
    
    
end
