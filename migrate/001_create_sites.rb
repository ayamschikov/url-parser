# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:sites) do
      primary_key :id
      String :url, null: false
      String :title, null: false
      Integer :status, null: false
    end
  end

  down do
    drop_table(:sites)
  end
end
