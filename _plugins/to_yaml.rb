module TextFilter
	def to_yaml(input)
		input
	end
end

Liquid::Template.register_filter(TextFilter)
