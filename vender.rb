class Drink
  attr_reader :name, :count, :price
  def initialize(name, price, count)
    @name = name
    @count = count
    @price = price
  end
end

class VendingMachine
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze
  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    cola = Drink.new("cola", 120, 5)
    soda = Drink.new("soda", 120, 5)
    tea = Drink.new("tea", 100, 5)
    @menu = {cola: cola, soda: soda, tea: tea}
  end
  #現在の商品在庫を取得できる
  #ゆくゆくは購入時の在庫表示に使用したい
  def current_drinks
    @menu
  end
  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    return false unless MONEY.include?(money)
    # 自動販売機にお金を入れる
    @slot_money += money
  end

  #購入可能なメニューを表示する
  def purchasable_menu
    purchasable = []
    @menu.each_value { |drink|
      if (current_slot_money > drink.price) && (drink.count > 0)
        purchasable.push(drink.name)
      end
    }
    "購入可能：#{purchasable}"
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts @slot_money
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

end

vm = VendingMachine.new
vm.slot_money(1000)
