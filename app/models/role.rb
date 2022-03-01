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

    def lead
    # query the auditions table
    # find the first instance of an audition where
    # role.id = self.id && hired = true
    auditions_arry = Audition.where role_id: self.id
    # if nothing in the auditions array has hired: true then 
    # puts "no actor has been hired for this role"
    # binding.pry
        if auditions_arry.any? { |a| hired = true} 
            auditions.find_by hired: true
        else
            pp "no actor has been hired for this role"
        end

    end

    def understudy
        auditions_arry = Audition.where role_id: self.id
        if auditions_arry.any? { |a| hired = true} 
            arry = auditions.where { |a| a.hired = true } 
            binding.pry
            pp arry[1]
        else
            pp "no actor has been hired for this role"
        end
    end


end