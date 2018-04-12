require_relative '../lib/cart.rb'
require 'pry'

describe Cart do

  before do
    @cart = Cart.new
  end
  context "第一種情境：不打折" do
    it "第一集買一本" do
      @cart.add({ "1st": 1, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.caculate).to eq(100)
    end

    it "第一集買三本" do
      @cart.add({ "1st": 3, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.caculate).to eq(300)
    end
  end

  context "第二種情境：打5%折扣" do
    it "第一集買一本，第二集買一本" do
      @cart.add({"1st": 1, "2nd": 1, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.caculate).to eq(190)
    end

    it "第一集買兩本，第二集買兩本" do
      @cart.add({"1st": 2, "2nd": 2, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.caculate).to eq(380)
    end

    it "第一集買一本，第二集買兩本" do
      @cart.add({"1st": 1, "2nd": 2, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.caculate).to eq(290)
    end

    it "第一集買兩本，第二集買三本" do
      @cart.add({"1st": 2, "2nd": 3, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.caculate).to eq(480)
    end
  end

  context "第三種情境：打10%折扣" do
    it "第一集買一本，第二集買一本，第三集買一本" do
      @cart.add({"1st": 1, "2nd": 1, "3rd": 1, "4th": 0, "5th": 0 })
      expect(@cart.caculate).to eq(270)
    end

    it "第一集買兩本，第二集買兩本，第三集買兩本" do
      @cart.add({"1st": 2, "2nd": 2, "3rd": 2, "4th": 0, "5th": 0 })
      expect(@cart.caculate).to eq(540)
    end

    it "第一集買一本，第二集買兩本，第三集買一本" do
      @cart.add({"1st": 1, "2nd": 2, "3rd": 1, "4th": 0, "5th": 0 })
      expect(@cart.caculate).to eq(370)
    end
  end

  context "第四種情境：打20%折扣" do
    it "第一集買一本，第二集買一本，第三集買一本，第四集買一本" do
      @cart.add({"1st": 1, "2nd": 1, "3rd": 1, "4th": 1, "5th": 0 })
      expect(@cart.caculate).to eq(320)
    end
  end

  context "第三種情境：打25%折扣" do
    it "第一集買一本，第二集買一本，第三集買一本，第四集買一本，第五集買一本" do
      @cart.add({"1st": 1, "2nd": 1, "3rd": 1, "4th": 1, "5th": 1 })
      expect(@cart.caculate).to eq(375)
    end
  end
end


# 這是一道經典的 Kata 題目。

# 有一家書店在賣哈利波特系列的書籍，共有五集的哈利波特，每一本哈利波特定價為 100 元，為了推廣哈利波特，書店訂定了以下優惠：

# 購買 2 本不同集的哈利波特可以打 5% 折扣
# 購買 3 本不同集的哈利波特可以打 10% 折扣
# 購買 4 本不同集的哈利波特可以打 20% 折扣
# 購買 5 本不同集的哈利波特可以打 25% 折扣
# 因此，我們要來寫一個可以計算出書籍總價的功能。