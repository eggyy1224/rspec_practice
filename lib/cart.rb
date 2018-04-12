class Cart
  PRICE = 100
  def add(items)
    @order_items = items.map { |k, v| v }
  end

  def caculate
    total = 0
    # 直到quantity大於零的項目都沒了迴圈才停止
    until @order_items.select { |quantity| quantity > 0 }.count == 0 
      # 先將量大於零的書選出來
      @order_items = @order_items.select { |quantity| quantity > 0 }
      # 算不同的冊數，對應到不同的價格，加到total
      case @order_items.count
      when 1 then total += (1 * PRICE)
      when 2 then total += (2 * PRICE * 0.95)
      when 3 then total += (3 * PRICE * 0.9)
      when 4 then total += (4 * PRICE * 0.8)
      when 5 then total += (5 * PRICE * 0.75)
      end
      # 這回合結束後每冊的量各減一
      @order_items = @order_items.map { |quantity| quantity - 1 }
    end 
    total
  end
end

# 這是一道經典的 Kata 題目。

# 有一家書店在賣哈利波特系列的書籍，共有五集的哈利波特，每一本哈利波特定價為 100 元，為了推廣哈利波特，書店訂定了以下優惠：

# 購買 2 本不同集的哈利波特可以打 5% 折扣
# 購買 3 本不同集的哈利波特可以打 10% 折扣
# 購買 4 本不同集的哈利波特可以打 20% 折扣
# 購買 5 本不同集的哈利波特可以打 25% 折扣
# 因此，我們要來寫一個可以計算出書籍總價的功能。