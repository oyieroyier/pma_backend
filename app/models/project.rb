class Project < ActiveRecord::Base

    has_many :links
    has_many :users, through: :links


    enum :status, [ :CREATED, :ONGOING, :COMPLETED, :CANCELLED ]

end