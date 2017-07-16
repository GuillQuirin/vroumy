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
	def empty_field_name(field)
		if field
			return field.name
		else
			return '&empty;'.html_safe
		end
	end
	def empty_field(field)
		if !field.empty? || !field.blank?
			return field
		else
			return '&empty;'.html_safe
		end
	end
end
