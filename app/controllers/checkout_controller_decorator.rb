CheckoutController.class_eval do
  helper :locations

  def edit

    flash[:notice] = I18n.t(:order_processed_successfully)
    flash[:commerce_tracking] = "nothing special"
    respond_with(@order, :location => completion_route)
#    if @order.update_attributes(object_params)
#      if @order.next
#        state_callback(:after)
#      else
#        flash[:error] = I18n.t(:payment_processing_failed)
#        respond_with(@order, :location => checkout_state_path(@order.state)) and return
#      end

#      if @order.state == "complete" || @order.completed?
#        flash[:notice] = I18n.t(:order_processed_successfully)
#        flash[:commerce_tracking] = "nothing special"
#        respond_with(@order, :location => completion_route)
#      else
#        respond_with(@order, :location => checkout_state_path(@order.state))
#      end
#    else
#      respond_with(@order) { |format| format.html { render :edit } }
#    end

  end
end
