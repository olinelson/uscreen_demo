class DaisyUiFormBuilder < ActionView::Helpers::FormBuilder
  @@select_classes = "select select-bordered w-full"

  def text_field(method, opts = {})
    opts[:class] = [ "input w-full validator", opts[:class] ].compact.join(" ")
    super(method, opts)
  end

  def email_field(method, opts = {})
    opts[:class] = [ "input w-full validator", opts[:class] ].compact.join(" ")
    super(method, opts)
  end

  def password_field(method, opts = {})
    opts[:class] = [ "input w-full validator", opts[:class] ].compact.join(" ")
    super(method, opts)
  end

  def check_box(method, opts = {})
    opts[:class] = [ "checkbox", opts[:class] ].compact.join(" ")
    opts[:class] = opts[:class].gsub("checkbox", "") if opts[:class].include?("toggle")
    super(method, opts)
  end


  def label(method, text = nil, opts = {}, &block)
    opts[:class] = [ "label", opts[:class] ].compact.join(" ")
    super(method, text, opts, &block)
  end

  def submit(value = nil, opts = {})
    opts[:class] = [ "btn btn-primary", opts[:class] ].compact.join(" ")
    super(value, opts)
  end

  def file_field(method, opts = {})
    opts[:class] = [ "file-input w-full", opts[:class] ].compact.join(" ")
    super(method, opts)
  end

  def time_zone_select(method, priority_zones = nil, options = {}, html_options = {})
    html_options[:class] = [ @@select_classes, html_options[:class] ].compact.join(" ")
    super(method, priority_zones, options, html_options)
  end

  def datetime_field(method, options = {})
    options[:class] = [ "input flex w-full validator", options[:class] ].compact.join(" ")
    super(method, options)
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    html_options[:class] = [ @@select_classes, html_options[:class] ].compact.join(" ")
    super(method, collection, value_method, text_method, options, html_options)
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    html_options[:class] = [ @@select_classes, html_options[:class] ].compact.join(" ")
    super(method, choices, options, html_options, &block)
  end
end
