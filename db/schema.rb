# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_619_064_426) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'incomes', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'payer', null: false
    t.integer 'amount', null: false
    t.string 'frequency', null: false
    t.string 'pay_day'
    t.date 'start_date', null: false
    t.date 'end_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'payee_id', null: false
    t.index ['payee_id'], name: 'index_incomes_on_payee_id'
  end

  create_table 'one_time_payments', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'payee', null: false
    t.string 'description', null: false
    t.date 'paid_at', null: false
    t.integer 'amount', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'payee_id', null: false
    t.index ['payee_id'], name: 'index_one_time_payments_on_payee_id'
  end

  create_table 'recurring_payments', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'payee', null: false
    t.string 'description', null: false
    t.integer 'due_day', null: false
    t.string 'amount', null: false
    t.date 'start_date', null: false
    t.date 'end_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'payer_id', null: false
    t.index ['payer_id'], name: 'index_recurring_payments_on_payer_id'
  end

  create_table 'users', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'email', null: false
    t.string 'phone_number', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['phone_number'], name: 'index_users_on_phone_number', unique: true
  end

  add_foreign_key 'incomes', 'users', column: 'payee_id'
  add_foreign_key 'one_time_payments', 'users', column: 'payee_id'
  add_foreign_key 'recurring_payments', 'users', column: 'payer_id'
end
