require 'spec_helper'

describe Fuchikoma::DiffParser::LineParser do
  subject { described_class.new }

  describe '#parse' do
    it 'should store attributes' do
      subject.parse('-    rspec-core (2.14.5)')
      expect(subject.sign).to eq '-'
      expect(subject.gem_name).to eq 'rspec-core'
      expect(subject.version_number).to eq '2.14.5'

      subject.parse('+    rspec-core (2.14.6)')
      expect(subject.sign).to eq '+'
      expect(subject.gem_name).to eq 'rspec-core'
      expect(subject.version_number).to eq '2.14.6'
    end
  end
end
