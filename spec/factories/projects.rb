FactoryBot.define do
  factory :project do
    name { "Project" }
    user 

    factory :project_with_tasks do
      after :create do |project, evaluator|
        create_list :task, 3, project: project
      end
    end
  end
end

