class CreateArticles < ActiveRecord::Migration[7.0]
  skip_before_action :verify_authenticity_token
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :category
      t.string :body
      t.date :date
      t.timestamps
    end
  end
end
