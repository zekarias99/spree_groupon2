OrdersController.class_eval do

  def edit
    @order = current_order(true)
  end

  # Покупка в подарок
  #
  def present
    @order = current_order(true)

    if params[:present] && params[:present][:email]
      @order.update_attribute(:present_email,params[:present][:email])
    end

    redirect_to checkout_state_path(:payment)
  end
  def populate

    @order = current_order(true)
    if @order = current_order
      @order.line_items.destroy_all
    end


    params[:products].each do |product_id,variant_id|
      quantity = params[:quantity].to_i if !params[:quantity].is_a?(Hash)
      quantity = params[:quantity][variant_id].to_i if params[:quantity].is_a?(Hash)
      @order.add_variant(Variant.find(variant_id), quantity) if quantity > 0
    end if params[:products]

    params[:variants].each do |variant_id, quantity|
      quantity = quantity.to_i
      @order.add_variant(Variant.find(variant_id), quantity) if quantity > 0
    end if params[:variants]

    respond_with(@order) { |format| format.html { redirect_to cart_path } }
  end

end
