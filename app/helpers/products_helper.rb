module ProductsHelper


    def iconify_active(estado)
        if estado == true
            return '<span class="badge bg=success">EN STOCK</span>'
        else
            return '<span class="badge bg=danger">SIN STOCK</span>'
        end
    end

    def icono_oferta(oferta)
        if oferta == true
            return '<span class="badge bg=success">ONSALE!</span>'
        else 
            return '<span class="badge bg=success">PRECIO CONTADO</span>'
        end
    end 

     # Agrega Cartel de Oferta
  def product_on_sale?(product)
    if product.onsale == true
      return '<span class="badge bg-success">OFERTA!</span>'
    end
  end

 # def agregarcarrito(order)
 #   order = @line_item
 # end

  # Calcula el precio, en base al porcentaje de descuento
  def price_calculate(product)
    if (product.discountPercentage) > 0
      percentage = ((product.price * product.discountPercentage) / 100)
      return product.price - percentage
    else
      return product.price
    end
  end

  def check_stock(product)
    if product.stock < 1
      return link_to 'NO STOCK', "#", class: 'btn btn-sm btn-outline-danger disabled'
    else
      return link_to 'COMPRAR', product, class: 'btn btn-sm btn-outline-success'
      #return button_to "agregar al carrito", line_items_path(:product_id => product.id) 
    end
  end



end
