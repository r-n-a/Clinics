class ClinicsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :allc]
	before_action :one_clinic, only: [:new]
	before_filter :is_admin, only: [:allc]

	def show
		if current_user.clinics.first
			@clinic = current_user.clinics.first
			#@clinic = Clinic.find(params[:id])
		else
			@clinic= Clinic.new
			render 'clinics/new'
		end
	end
	
	def index
		@clinics = Clinic.all
	end
	
	def allc
		@clinics = Clinic.all
	end
	
	def new 
		@clinic= Clinic.new
	end
	
	def create
		@clinic= current_user.clinics.build(clinic_params)
		if @clinic.save
			flash[:success] = "Added a new clinic!"
			redirect_to root_url
		else
			render 'clinics/new'
		end
	end
	
	def edit
		@clinic = Clinic.find(params[:id])
	end

	 def update
		@clinic = Clinic.find(params[:id])
		@clinic.tel.gsub(/(\-|\s|\+)/){ |word|  word="" }
		if @clinic.update_attributes(clinic_params)
			flash[:success] = "Profile updated"
			redirect_to @clinic
		else
		  render 'edit'
		end
	 end
	
	def destroy
		if  current_user.username == "Admin"
			Clinic.find(params[:id]).destroy
			flash[:success] = "Clinic deleted."
			redirect_to clinics_path
		else
			redirect_to clinics_path
		end
	 end
	
	private

    def clinic_params
		params.require(:clinic).permit(:name, :typec, :adress, :tel, :zipcode, :avatar, :avatar_cache)
    end
	
	def is_admin
		if current_user.username != "Admin"
			redirect_to root_url
		end
    end
	
	def one_clinic
		if current_user.clinics.all .count>1
			redirect_to root_url
		end
	end

end
