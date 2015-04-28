class ProceduresController < ApplicationController
	helper_method :sort_column, :sort_direction
	before_filter :authenticate_user!, :except => [:index, :show, :search, :searchp]
	before_action :get_proc,   only: [:show, :edit, :update, :destroy]
	
	def show
	end
	
	def index
		if  current_user.clinics.first
			@clinic = current_user.clinics.first
			@procedures = @clinic.procedures.all
		elsif current_user.clinics.first
			@procedure = Procedure.new
			render 'procedures/new'
		else
			@clinic= Clinic.new
			render 'clinics/new'
		end
	end
	
	def search
		@procedures = Procedure.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 6)
	end
	
	def searchp
		p_name = (params[:searchInput1])
		c_adress = (params[:searchInput2])
		@procedures = Procedure.joins(:clinic).where("clinics.adress LIKE '%#{c_adress}%' AND procedures.name LIKE '%#{p_name}%' ").paginate(page: params[:page], :per_page => 6)
	end
	
	def new 
		@procedure = Procedure.new
	end
	
	def create
		@clinic = current_user.clinics.first
		@procedure = @clinic.procedures.build(procedure_params)
		if @procedure.save
			flash[:success] = "Added a new procedure !"
			redirect_to procedures_path
		else
			render 'procedures/new'
		end
	end
	
	def edit
	end

	 def update
		if @procedure.update_attributes(clinic_params)
			flash[:success] = "Procedure updated"
			redirect_to @procedure
		else
		  render 'edit'
		end
	 end
	
	def destroy
		if  current_user.username == "Admin"
			@procedure.destroy
			if @procedure.destroy
				redirect_to procedures_path, notice: "Procedure deleted."
			end
		 else
			redirect_to clinics_path
		end
	end
	
	private

    def procedure_params
		params.require(:procedure).permit(:name, :cost)
    end
	
	def sort_column
		Procedure.column_names.include?(params[:sort]) ? params[:sort] : "cost"
	 end
	  
	 def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	 end
	 
	 def get_proc
		@procedure = Procedure.find(params[:id])
    end

end
