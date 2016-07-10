class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.string :screen_name
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.string :image_url
      t.string :wiki_url
      t.date :birth_date
      t.date :death_date

      t.timestamps null: false
    end
  end
end
