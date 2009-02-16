ActiveRecord::Schema.define(:version => 0) do
  create_table :chickens, :force => true do |t|
    t.string :name
    t.timestamps
  end
end
