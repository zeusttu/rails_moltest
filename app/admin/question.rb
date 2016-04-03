ActiveAdmin.register Question do
  permit_params :q, :mole_test_id, :answers
  
  after_create do |record|
    errors = []
    if !record.nil? && !record.q.nil?
      params[:question][:answers_attributes].each do |i, answer|
        if !Answer.create({a: answer[:a], question_id: record.id})
          errors << "Could not create answer #{a[:a]}"
        end
      end
      if errors.length
        flash[:error] = errors.join "\n"
      end
    end
  end
  
  index do
    selectable_column
    id_column
    column :mole_test_id
    column :q
    column(:answers) { |q| q.answers.count }
    column :answer
    actions
  end
  
  form do |f|
    f.inputs "Question Details" do
      f.input :mole_test
      f.input :q
      f.has_many :answers, new_record: true do |ai|
        ai.input :a
      end
    end
    f.actions
  end
end
