class AddBookDescription < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :descricao, :text
  end
end
