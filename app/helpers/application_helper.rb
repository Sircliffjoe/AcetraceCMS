module ApplicationHelper
	# Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "AcetraceCMS"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
	def header(text)
		content_for(:header) { text.to_s }
	end
	







	
	# Returns the name of an icon (in public/images) for the
# given content type
def icon_for content_type
	case content_type.to_s.strip
	when "image/jpeg"
		"JPG"
	when "application/vnd.ms-excel"
		"XLS"
	when "application/msword"
		"DOC"
	when "application/pdf"
		"PDF"
	else "Generic"
  end
end
# Returns a textual description of the content type
	def description_of content_type
		case content_type.to_s.strip
		when "image/jpeg"
			"JPEG graphic"
		when "application/vnd.ms-excel"
			"Excel worksheet"
		when "application/msword"
			"Word document"
		when "application/pdf"
			"PDF file"
		else ""
		end
	end
# Returns the name of the site (for the title and h1 elements)
def site_title
'Intranet'
end

# Returns a div with the user's thumbnail and name
	def user_thumb user
		img = tag("img",
		:src => formatted_user_url(:id => user, :format =>'jpg'),
		:class =>'user_picture', :alt => user.first_name)
		img_link = link_to img, user_url(:id => user)
		text_link = link_to user.last_name, user_url(:id => user)
		content_tag :div, "#{img_link}<br/>#{text_link}",
		:class =>'user'
	end
# Returns a div
def clear_div
	'<div class="clear"></div>'
end
# Renders the form used for all post and user creating/editing.
# Yields an instance of LabelingFormBuilder
# (see lib/labeling_form_helper.rb).
def standard_form name, object, &block
		url = { :action => object.new_record? ? "index" : "show" }
		html = { :class => "standard",
		:style => (@edit_on ? '' : "display: none;"),
		:multipart => true }
		concat form_tag(url, html) + "<fieldset>", block.binding
		unless object.new_record?
		concat '<input name="_method" type="hidden" value="put" />',
		block.binding
	end
		yield LabelingFormBuilder.new(name, object, self, {}, block)
		concat "</fieldset>" + end_form_tag, block.binding
	end
# Standard submit button and delete link for posts and users
	
end
