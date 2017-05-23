class Contract < ApplicationRecord
  
  
  
  validates :title, presence: true,
                    length: { minimum: 1, maximum: 70 }
  validates :description,  presence: true,
                    length: { minimum: 1, maximum: 1000 }
                    
  validates :email,  presence: true,
                    length: { minimum: 1 }                  
  
  
end
