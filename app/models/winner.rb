class Winner < ActiveRecord::Base
  belongs_to :winner, foreign_key: 'user_id'
end
