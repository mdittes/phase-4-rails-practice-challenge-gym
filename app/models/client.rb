class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships

    def membership_total
        memberships.sum(:charge)
    end

end
