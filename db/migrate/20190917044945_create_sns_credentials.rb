class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.references  :user, null:false, foreign_key:true
      t.integer     :uid, null:false, unique:true
      t.integer     :provider, null:false
      t.timestamps
    end
  end
end