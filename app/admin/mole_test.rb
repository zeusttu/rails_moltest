ActiveAdmin.register MoleTest do
  permit_params :testnum, :questions
  
  after_create do |record|
	errors = []
    if !record.nil? && !record.testnum.nil?
      params[:mole_test][:questions_attributes].each do |i, question|
        if Question.create({q: question[:q], mole_test_id: record.id})
		  correctAnswer = question[:answers_attributes]["0"]
		  answer_keys = question[:answers_attributes].keys.sort_by { rand }
		  createdQuestion = Question.last
		  answer_keys.each do |j|
			if !Answer.create({a: question[:answers_attributes][j][:a], question_id: createdQuestion.id})
			  errors << "Could not create answer #{question[:answers_attributes][j][:a]}"
			end
		  end
		  createdQuestion.update_attributes :answer_id => Answer.where(question_id: createdQuestion.id, a: correctAnswer[:a]).first.id
        else
          errors << "Could not create question #{question[:q]}"
        end
      end
      if errors.length
		byebug
        flash[:error] = errors.join "\n"
      end
    end
  end
  
  index do
    selectable_column
    id_column
    column :testnum
    column(:questions) { |t| t.questions.count }
    actions
  end
  
  form do |f|
    f.inputs "Test Details" do
      f.input :testnum
      f.has_many :questions, new_record: true do |qi|
        qi.input :q
        qi.has_many :answers, new_record: true do |ai|
          ai.input :a
        end
      end
    end
    f.actions
  end
end
