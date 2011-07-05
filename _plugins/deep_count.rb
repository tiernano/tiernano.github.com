module DeepCountFilter
	def deep_count(input)
		count = 0
		input.flatten.each do |val|
			if val.is_a?(Jekyll::Post)
				count = count + 1
			elsif val.is_a?(Hash) || val.is_a?(Array)
				count = count + deep_count(val)
			end
		end
		count
	end
end

Liquid::Template.register_filter(DeepCountFilter)
