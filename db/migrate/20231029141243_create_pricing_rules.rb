class CreatePricingRules < ActiveRecord::Migration[7.1]
  def change
    create_table :pricing_rules do |t|
      t.references :product, null: false, foreign_key: true
      t.string :rule_type, null: false
      t.json :rule_params
      t.date :valid_from
      t.date :valid_to
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
