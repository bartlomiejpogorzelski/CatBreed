class Avo::Actions::AcceptSale < Avo::BaseAction
  self.name = "Accept Sale"
  self.visible = -> {
    view.show? && resource.record.reserved? 
  }

  # def fields
  #   # Add Action fields here
  # end

  def handle(query:, fields:, current_user:, resource:, **args)
    query.each do |cat|
      if cat.update(status: :sold)
        succeed "Kot został sprzedany. #{cat.name}."
      else
        fail "Kot #{cat.name} nie został sprzedany."     
      end
    end
  end
end

