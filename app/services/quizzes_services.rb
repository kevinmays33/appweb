# The QuizzesServices class is responsible for creating quizzes using the OpenAI API.
class QuizzesServices
  OPTION_PER_QUESTION = 4
  ALPHABETICS = ("A".."Z").to_a

  attr_reader :topic, :model, :length, :name

  def initialize(topic: "Topic", model: "gpt-4o-mini", length: 10, name: "Quiz #{Time.now.to_i}")
    @topic = topic
    @model = model
    @length = length
    @name = name
  end

  def quizzify(quiz_content:)
    quiz = Quiz.create(topic: topic, length: length, name: name)
    create_questions_and_options(quiz: quiz, quiz_content: quiz_content)
    quiz
  end

  def create_questions_and_options(quiz:, quiz_content:)
    quiz_content.each do |quiz_element|
      question = Question.create(
        text: quiz_element["question"],
        quiz_id: quiz.id
      )
      create_options(question: question, quiz_element: quiz_element)
    end
  end

  def create_options(question:, quiz_element:)
    OPTION_PER_QUESTION.times do |iterator|
      letter = ALPHABETICS[iterator]
      Option.create(
        text: quiz_element[letter],
        question_id: question.id,
        letter: letter,
        correct: quiz_element["answer"] == letter
      )
    end
  end

  def create
    prompt = "Create #{length} multiple choice questions about #{topic} with #{OPTION_PER_QUESTION} options on each question and indicate the correct answer. Use this JSON format for answering and write it in a single line : " + '[{"question": "question", "A": "option", "B": "option","C": "option", "D": "option","answer": "B"}].'
    response = Openai.new(prompt: prompt, model: model, role: :user).chat
    if response.success?
      quizzify(quiz_content: JSON.parse(response.content))
    else
      raise Openai::OpenaiException.new(response.error)
    end
  end
end
