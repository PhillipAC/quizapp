class MembershipsController < ApplicationController
    def new
        @membership = Membership.new
        @team = Team.find params[:id]
        @non_members = non_members(@team)
    end
    
    def create
        membership_params.each do |user|
            user = user.split(" ")
            @membership = Membership.new(user[0], user[1])
            @membership.save
        end
        
        #redirect_to root_path
    end
    
    private
        def membership_params
           params.permit(:memberships_ids)
        end
        
        def non_members(team)
            #Finds all Users that are not already members or coaches
            User.where.not(id: team.member_ids).where.not(id: team.coach_ids)
        end
    
end
