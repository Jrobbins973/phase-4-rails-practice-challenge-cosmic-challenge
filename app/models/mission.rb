class Mission < ApplicationRecord
    belongs_to :scientist 
    belongs_to :planet

    validates :name, presence: true
    validates :scientist_id, presence: true, uniqueness: {scope: :scientist, message: "A scientist cannot join a mission more than once"}
    validates :planet, presence: true    
    
    
    
    
    
end
