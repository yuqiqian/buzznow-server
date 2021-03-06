module GlobalHelper
	def success_return
		return {"msg"=>"OK", "ret"=>0}
	end

	def fail_save
		return {"msg"=>"saving failed", "ret"=>4}
	end

	def fail_update
		return {"msg"=>"update failed", "ret"=>5}
	end

	def fail_find
		return {"msg"=>"cannot find this user", "ret"=>6}
	end

	def duplicate_create
		return {"msg"=>"Related record already exits, cannot create this record", "ret"=>7}
	end

	def general_return_function(category, judgement, object_name,return_object=nil)
		case category
		when "find"
			if judgement
				res = success_return
				res[object_name] = return_object
				render json: res
			else
				render json: fail_find
			end
		when "save"
			if judgement
				render json: success_return
			else
				render json: fail_save
			end
		when "update"
			if judgement
				render json: success_return
			else
				render json: fail_update
			end
		end
	end

	def object2hash(obj)
		hash = {}
		obj.attributes.each do |k, v|
			if v.is_a?(BigDecimal)
				hash[k] = v.to_f
			else
				hash[k] = v
			end
		end
		return hash
	end
			
		
end