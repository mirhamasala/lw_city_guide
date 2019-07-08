class CreateJoinTableCitiesUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cities, :users do |t|
      # t.index [:city_id, :user_id]
      # t.index [:user_id, :city_id]
    end
  end
end
