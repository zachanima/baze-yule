module ApplicationHelper
  def tooltip(content, text = '&hellip;', type = nil)
    content = html_escape content unless content.html_safe? 
    text    = html_escape text    unless text.html_safe? 
    ['<span class="tooltip">', text, case type
      when :img then ['<img src="', content, '" />'].join
      else           "<div>#{content}</div>"
    end, '</span>'].join.html_safe
  end
end
