module ApplicationHelper
  def tooltip(content, text)
    text = html_escape text unless text.html_safe? 

    ['<span class="tooltip">', text,

      # Paperclip
      if content.is_a? Paperclip::Attachment
        ['<img src="', content, '" />'].join

      # Collection
      elsif content.is_a? Array
        ['<div>', html_escape(content.collect(&:name) * "\n"), '</div>'].join

      end, '</span>'].join.html_safe unless content.blank?
  end
end
