class AddPasswordDigestToUsers < ActiveRecord::Migration[8.0]
  def up
    add_column :users, :password_digest, :string

    User.column_names.each do |column|
      unless column.in? %w[id email password_digest created_at updated_at]
        remove_column :users, column.to_sym
      end
    end
  end
end
