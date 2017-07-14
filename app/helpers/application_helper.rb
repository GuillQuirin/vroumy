module ApplicationHelper
	def notice_name(name)
		return :info unless %w(info success warning danger).include?(name)
		name
	end
	def date_format(date)
		date.strftime("%d/%m/%Y %I:%M:%S")
	end
	def short_date_format(date)
		date.strftime("%d/%m/%Y")
	end
end
