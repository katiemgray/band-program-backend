class Mutations::CreateStudent < Mutations::BaseMutation
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :grade, Int, required: true
  argument :instrument_type_id, Int, required: true
  argument :school_id, Int, required: true

  field :student, Types::StudentType, null: false
  field :errors, [String], null: false

  def resolve(school_id:, **attributes)
    student = School.find(school_id).students.create(attributes)
    if student.save 
      {student: student, errors: []}
    else 
      {student: nil, errors: student.errors.full_messages}
    end
  end
end