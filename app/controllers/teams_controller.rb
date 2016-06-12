class TeamsController < ApplicationController
    
    def create
        @team = Team.new(team_params)
        if @team.save
            @leadership = 
                Leadership.new(user_id: current_user.id,team_id: @team.id)
                @leadership.save
            flash[:team_id] = @team.id
            redirect_to new_team_url
        else
            render :action => "new"
        end
    end
    
    def new
        @team = Team.new
    end
    
    def show
        @team = Team.find(params[:id])
    end
    
    def index
        @teams = Team.all
    end
    
    def destroy
        @team = Team.find(params[:id])
    end
    
    def update
        @team = Team.find(params[:id])
    end
    
    def edit
        @team = Team.find params[:id] 
    end
    
    private
        def team_params
            params.require(:team).permit(:name)
        end
end
