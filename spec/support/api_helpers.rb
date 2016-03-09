module ApiHelpers
  def json_body
    JSON.parse(response.body)
  end

  def serialized_model(object)
    JSON.parse(ActiveModel::Serializer::Adapter.create("#{object.class}Serializer".constantize.new(object)).to_json)["data"]
  end
end

RSpec.configure do |config|
  config.include ApiHelpers, type: :request
end
