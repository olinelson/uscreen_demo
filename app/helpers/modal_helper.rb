module ModalHelper
  def modal_link(name = nil, options = nil, html_options = nil, &block)
    html_options, options, name = options, name, nil if block_given?
    options ||= {}
    html_options = convert_options_to_data_attributes(options, html_options)
    url = url_for(options)
    html_options["href".freeze] ||= url
    dialog_id = html_options["id"] + "_dialog"
    button_id = html_options["id"] + "_button"
    html_options["persist"] = true if html_options["persist"].nil?


    template = tag.dialog(id: dialog_id, class: "modal modal-bottom sm:modal-middle", data: { turbo_temporary: true, controller: "modal", modal_open_value: false, modal_persist_value: html_options["persist"], modal_modal_link_outlet: button_id, action: "keydown.esc->modal#close:prevent"  }) do
        tag.div(class: "modal-box") do
          tag.button(class: "btn btn-sm btn-circle btn-ghost absolute right-2 top-2 z-10", data: { action: "modal#close" }) do
            icon "x"
          end  +
          tag.turbo_frame(id: html_options["id"], src: html_options["href"], loading: "eager") do
            tag.div(class: "grid place-items-center") do
              tag.div(class: "loading loading-spinner")
            end
          end
        end +
        tag.form(method: "dialog", data: { action: "modal#close" }, class: "modal-backdrop") do
          tag.button { "close" }
        end
    end

    tag.button(id: button_id, class: html_options["class"], data: {
      controller: "modal-link",
      action: "click->modal-link#open mouseover->modal-link#load touchstart->modal-link#load",
      modal_link_modal_outlet: "##{dialog_id}",
      modal_link_src_value: html_options["href"],
      modal_link_id_value: html_options["id"],
      modal_link_template_value: template
    }) do
      block_given? ? capture(&block) : name
    end
  end

  def modal(name = nil, options = nil, html_options = nil, &block)
    html_options, options, name = options, name, nil if block_given?
    options ||= {}
    html_options = convert_options_to_data_attributes(options, html_options)


    tag.dialog(id: html_options["id"], class: "modal modal-bottom sm:modal-middle", data: { turbo_temporary: true }) do
        tag.div(class: "modal-box") do
          tag.form(method: "dialog", class: "absolute right-2 top-2") do
             tag.button(class: "btn btn-sm btn-circle btn-ghost") do
               icon "x"
             end
           end +
          capture(&block)
        end +
        tag.form(method: "dialog", class: "modal-backdrop") do
          tag.button { "close" }
        end
    end +
    tag.button(class: html_options["class"],  onclick: "#{html_options["id"]}.showModal()") do
      icon html_options["name"] if html_options["name"]
      icon html_options["icon"] if html_options["icon"]
    end
  end
end
