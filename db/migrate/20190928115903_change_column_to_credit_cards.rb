class ChangeColumnToCreditCards < ActiveRecord::Migration[5.2]
  def up
    change_column :credit_cards, :card_number, :string
  end
  
  def down
    change_column :credit_cards, :card_number, :integer
  end
end
