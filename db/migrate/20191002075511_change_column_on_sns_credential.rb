class ChangeColumnOnSnsCredential < ActiveRecord::Migration[5.2]
  def up
    change_column :sns_credentials, :uid, :string
    change_column :sns_credentials, :provider, :string
  end
  def down
    change_column :sns_credentials, :uid, :integer
    change_column :sns_credentials, :provider, :integer
  end
end
