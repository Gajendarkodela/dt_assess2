class CreateJoinTableModelProject < ActiveRecord::Migration[5.1]
  def change
    create_join_table :models, :projects do |t|
      # t.index [:model_id, :project_id]
      # t.index [:project_id, :model_id]
    end
  end
end
