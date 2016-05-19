class HealthsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy
    
    def create
        @health = current_user.healths.build(health_params)
        @health.bmi = cal_bmi
        if @health.save
            flash[:success] = "Đã tính xong!"
            redirect_to current_user
        else
            render 'static_pages/home'    
        end
    end
    
    def destroy
        @health.destroy
        flash[:success] = "Result deleted"
        redirect_to request.referrer || root_url
    end
    
    private
    
        def health_params
            params.require(:health).permit(:height, :weight)
        end
        
        def cal_bmi
            height = @health.height.to_f
            height /= 100
            weight = @health.weight.to_f
            @health.bmi = (weight / (height ** 2))
        end
        
        def correct_user
          @health = current_user.healths.find_by(id: params[:id])
          redirect_to root_url if @health.nil?
        end
end
