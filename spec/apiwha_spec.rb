require 'vcr'

RSpec.describe Apiwha do
  let(:api_key) { "api key" }

  it "has a version number" do
    expect(Apiwha::VERSION).not_to be nil
  end

  it 'check if pull_messages call is an Array' do
    VCR.use_cassette 'pull_messages' do
      result = Apiwha.new(api_key).pull_messages
      expect(result).to be_kind_of(Array)
    end
  end
end
