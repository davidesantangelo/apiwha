require 'vcr'

RSpec.describe Apiwha do
  let(:api_key) { "7MYIVBY90WRH2H758JB8" }

  it "has a version number" do
    expect(Apiwha::VERSION).not_to be nil
  end

  it 'check if messages call is an Array' do
    VCR.use_cassette 'messages' do
      result = Apiwha.new(api_key).messages
      expect(result).to be_kind_of(Array)
    end
  end
end
