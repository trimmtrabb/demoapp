class CursorPaginator
  attr_reader :relation

  def initialize(relation)
    @relation =
      if ::ActiveRecord::Relation === relation
        self
      else
        relation.all
      end
  end

  def generate_page(specs)
    order, limit = specs.values_at(:order, :size)
    nav_dir, pointer = specs[:cursor].values_at(:nav_dir, :pointer)

    case order
    when 'asc'
      case nav_dir
      when 'after'
        relation.where("id > ?", pointer).limit(limit).order(id: 'asc')
      when 'before'
        relation.where("id < ?", pointer).limit(limit).order(id: 'desc').to_a.reverse
      end
    when 'desc'
      case nav_dir
      when 'after'
        relation.where("id < ?", pointer).limit(limit).order(id: 'desc')
      when 'before'
        relation.where("id > ?", pointer).limit(limit).order(id: 'asc').to_a.reverse
      end
    end
  end
end
