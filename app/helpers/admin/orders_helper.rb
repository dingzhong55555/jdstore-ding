module Admin::OrdersHelper
  def render_order_state(order)
    if order.is_paid?
      "已付款"
    else
      "为付款"
    end
  end
end
