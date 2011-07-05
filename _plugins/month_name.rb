module MonthNameFilter
	def month_name(input)
		Date::MONTHNAMES[input]
	end
end

Liquid::Template.register_filter(MonthNameFilter)
