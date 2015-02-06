class CreateGuesses < ActiveRecord::Migration
after do
  ActiveRecord::Base.clear_active_connections!
end

  def change
    create_table :guesses do |t|
    	t.integer	:height
    	t.integer :weight
    	t.string	:gender
    	t.boolean :accuracy

      t.timestamps
    end
  end
end


