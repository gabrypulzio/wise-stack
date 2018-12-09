# frozen_string_literal: true

module BootstrapHelper
  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      next if message.blank?

      Array(message).each do |msg|
        text = bootstrap_alert msg, bootstrap_type_for_flash_type(type), options
        flash_messages << text.html_safe if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

  def bootstrap_close_button
    content_tag(:button, type: 'button', class: 'close', 'data-dismiss' => 'alert',
                         'aria-label' => 'Close') do
      content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
    end
  end

  def bootstrap_type_for_flash_type(type)
    case type.to_s
    when 'notice' then 'success'
    when 'alert' then 'danger'
    when 'error' then 'danger'
    else 'secondary'
    end
  end

  def bootstrap_alert(text, type, options = {})
    tag_options = {
      class: "alert alert-#{type} #{options.extract!(:class)[:class]}"
    }.merge(options)
    content_tag(:div, (text + bootstrap_close_button).html_safe, tag_options)
  end
end
