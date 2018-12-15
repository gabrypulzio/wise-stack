# frozen_string_literal: true

module GuiHelper
  def model_actions(model_or_array, options = {})
    path = options.fetch(:path, model_or_array)
    edit_path = options.fetch(:edit_path, [:edit, model_or_array].flatten)

    content_tag :div, class: 'btn-group', role: 'group' do
      concat show_icon_link(path) if can_display_action?(:show, options)
      concat edit_icon_link(edit_path) if can_display_action?(:edit, options)
      concat destroy_icon_link(path) if can_display_action?(:destroy, options)
    end
  end

  def action_icon_link(icon, path, action, destroy_action = false)
    options = { title: t("actions.#{action}"),
                data: { toggle: 'tooltip',
                        placement: 'top',
                        container: 'body' },
                class: "btn btn-#{destroy_action ? 'danger' : 'secondary'}" }

    options[:data][:confirm] = t('destroy_confirm') if destroy_action
    link_to(%(<i class="fas fa-#{icon}"></i>).html_safe, path, options)
  end

  def show_icon_link(path)
    action_icon_link('eye', path, 'show')
  end

  def edit_icon_link(path)
    action_icon_link('pencil-alt', path, 'edit')
  end

  def destroy_icon_link(path)
    action_icon_link('trash-alt', path, 'edit', true)
  end

  def can_display_action?(action, options)
    options.fetch("display_#{action}".to_sym) { true }
  end
end
