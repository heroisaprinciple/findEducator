class PersonalMessage < ApplicationRecord
  belongs_to :user
  belongs_to :mentor
end
