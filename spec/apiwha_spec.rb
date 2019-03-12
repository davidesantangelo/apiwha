require 'vcr'

RSpec.describe Apiwha do
  let(:api_key) { "your api key" }

  it "has a version number" do
    expect(Apiwha::VERSION).not_to be nil
  end

  it 'check if pull_messages call is an Array' do
    VCR.use_cassette 'pull_messages' do
      result = Apiwha.new(api_key).pull_messages
      expect(result).to be_kind_of(Array)
    end
  end

  it 'send message' do
    VCR.use_cassette 'send_message' do
      result = Apiwha.new(api_key).send_message(number: '5491133381736', text: 'hello dude!')
      expect(result).not_to be_empty
    end
  end

  it 'get credit' do
    VCR.use_cassette 'get_credit' do
      result = Apiwha.new(api_key).get_credit
      expect(result).not_to be_empty
      expect(result['credit']).to be >= 0
    end
  end
end
