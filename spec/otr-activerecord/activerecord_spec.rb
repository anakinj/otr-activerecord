RSpec.describe OTR::ActiveRecord do

  def fixture(file)
    File.join(__dir__, '..', 'fixtures', file)
  end

  describe '.configure_from_file!' do
    context 'when simple configuration file is given' do
      let(:config) { fixture('configuration/simple.yml') }

      it 'configures active record' do
        described_class.configure_from_file!(config)

        expect(::ActiveRecord::Base.configurations['test']).to eq({
          'adapter' => 'sqlite3',
          'database' => 'tmp/simple.sqlite3',
          'migrations_paths' => ['db/migrate']
        })
      end
    end

    context 'when configuration file with multiple roles given' do
      let(:config) { fixture('configuration/multi.yml') }

      it 'configures active record' do
        pending 'Multi db configuration does not work yet'
        described_class.configure_from_file!(config)

        expect(::ActiveRecord::Base.configurations['test']).to eq({
          'adapter' => 'sqlite3',
          'database' => 'tmp/simple.sqlite3',
          'migrations_paths' => ['db/migrate']
        })
      end
    end
  end
end
