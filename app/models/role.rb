class Role < ActiveRecord::Base
    has_many :auditions
    def actors
        actors_names = []
        auditions_array = Audition.where role_id: self.id
        auditions_array.each {|a| actors_names << a.actor}
        pp actors_names
    end

    def locations
        actors_location_array = []
        auditions_array = Audition.where role_id: self.id
        auditions_array.each {|a| actors_location_array << a.location}
        pp actors_location_array
    end

end