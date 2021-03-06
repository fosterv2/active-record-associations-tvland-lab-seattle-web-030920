class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{last_name}"
    end

    def list_roles
        roles = self.characters
        shows = roles.map { |role| "#{role.name} - #{role.show.name}" }
    end
end