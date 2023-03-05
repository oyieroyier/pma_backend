class Project < ActiveRecord::Base
  has_many :links
  has_many :users, through: :links

  enum :status, %i[CREATED ONGOING COMPLETED CANCELLED]
end
