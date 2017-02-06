module Crawler
  class OrderTrackService
    attr_reader :aliexpress, :browser, :log, :order

    def initialize(order, browser, logger)
      @order = order
      @aliexpress = order.crawler.aliexpress
      @browser = browser
      @log = logger
    end

    def track!
      puts "========= Authenticate user for track an order"

      login
      open_order_page order.aliexpress_number

      sleep 5
      shipping_table = @browser.table(class: 'TP_ShippingTable')
      if shipping_table.exists?
        tracking_number = shipping_table.td(class: 'no')
        if tracking_number.exists?
          puts "========= Order already shipped: Getting tracking number #{tracking_number}"
          @log.add_message('Atualizando wordpress com código de rastreio do pedido '+ tracking_number)
          order.mark_as_tracked tracking_number
        else
          puts "========= Order not shipped yet: order number #{order_number}"
          @log.add_message('Não foi possível rastrear o pedido '+ order_number)
        end
      end

      tracking_number
    end

    private
    def login
      AuthenticationService.new(aliexpress, browser, log).login
    end

    def build_order_url(order_number)
      "https://trade.aliexpress.com/order_detail.htm?orderId=#{order_number}"
    end

    def open_order_page(order_number)
      @browser.goto build_order_url(order_number)
    end

  end
end