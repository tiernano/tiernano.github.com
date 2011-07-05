module PadNumberFilter
	def pad_number(input)
		"%02d" % input
	end
end

Liquid::Template.register_filter(PadNumberFilter)
