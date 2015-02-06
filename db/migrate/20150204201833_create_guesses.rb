class CreateGuesses < ActiveRecord::Migration


def with_connection(&block)
  ActiveRecord::Base.connection_pool.with_connection do
    yield block
  end
	ensure
	  ActiveRecord::Base.clear_active_connections!
	  ActiveRecord::Base.connection.close
end

  def change

		after do
	    with_connection do 
	  	do_things_with_activerecord_db_and_get_some_parameters()   
			end
	  end
    
    create_table :guesses do |t|
    	t.integer	:height
    	t.integer :weight
    	t.string	:gender
    	t.boolean :accuracy

      t.timestamps
    end
  end
end


