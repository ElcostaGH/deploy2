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

ActiveRecord::Schema[7.2].define(version: 2024_09_25_220145) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "utilizer_id", null: false
    t.text "content"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["utilizer_id"], name: "index_answers_on_utilizer_id"
  end

  create_table "course_enrollments", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_enrollments_on_course_id"
    t.index ["student_id"], name: "index_course_enrollments_on_student_id"
  end

  create_table "course_progresses", force: :cascade do |t|
    t.bigint "utilizer_id", null: false
    t.bigint "course_id", null: false
    t.integer "completed_lessons"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_progresses_on_course_id"
    t.index ["utilizer_id"], name: "index_course_progresses_on_utilizer_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "forums", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_forums_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.string "title"
    t.text "content"
    t.string "video_embed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "forum_id", null: false
    t.bigint "utilizer_id", null: false
    t.string "title"
    t.text "content"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_id"], name: "index_questions_on_forum_id"
    t.index ["utilizer_id"], name: "index_questions_on_utilizer_id"
  end

  create_table "utilizers", force: :cascade do |t|
    t.string "email"
    t.string "login"
    t.string "password"
    t.string "name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "utilizers"
  add_foreign_key "course_enrollments", "courses"
  add_foreign_key "course_enrollments", "utilizers", column: "student_id"
  add_foreign_key "course_progresses", "courses"
  add_foreign_key "course_progresses", "utilizers"
  add_foreign_key "courses", "utilizers", column: "teacher_id"
  add_foreign_key "forums", "lessons"
  add_foreign_key "lessons", "courses"
  add_foreign_key "questions", "forums"
  add_foreign_key "questions", "utilizers"
end
