class Views::Base < Fortitude::Widget
  doctype :html5

  private

  def row(args = {}, &block)
    div(add_classes(args, [:row]), &block)
  end

  def column(size = 'small-12 large-6 large-centered', args = {}, &block)
    div(add_classes(args, [:columns, size]), &block)
  end

  def full_row(args = {})
    row(args) { column { yield } }
  end

  def add_classes(args, classes)
    classes += Array(args.fetch(:class, []))
    args.merge(class: classes)
  end
end
