class StaticPagesController < ApplicationController
	
	def testp
	end
	
	def search
	end
	
	def get_proc_for_select
		words_id1 = params[:words_id1]
		if words_id1.length > 0
			@proc = Procedure.where("name LIKE '%#{words_id1}%' ")
			respond_to do |format|
				format.js   {}
				format.json { render json: @proc, status: :created, location: @proc }
			end	
		end	
	end
	
	def get_adr_for_select
		@adress_array = Array.new
		words_id2 = params[:words_id2]
		if words_id2.length > 0
			@adr = Clinic.where("adress LIKE '%#{words_id2}%' ")
			respond_to do |format|
				format.js   {}
				format.json { render json: @adr, status: :created, location: @adr }
			end
		end
	end

end
