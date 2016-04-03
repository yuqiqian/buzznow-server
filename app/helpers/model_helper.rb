module ModelHelper
	def clean_record(active_record)
		h = active_record.as_json.except!(["created_at","updated_at"])
		h.keys.each{|k| h = k.include?("_id") ? k.except!(k) : h}
		return h
	end
end