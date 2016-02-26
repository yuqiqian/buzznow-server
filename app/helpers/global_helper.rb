module GlobalHelper
	def success_return
		return {"msg":"OK", "ret":0}
	end

	def fail_save
		return {"msg":"saving failed", "ret":4}
	end

	def fail_update
		return {"msg":"update failed", "ret":5}
	end

	def fail_find
		return {"msg":"cannot find this user", "ret":6}
	end
end