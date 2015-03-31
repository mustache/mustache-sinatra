require 'mustache/sinatra'

RSpec.describe 'normal usage' do
  let(:app) {
    Class.new(Sinatra::Application) do
      set :mustache, {
                     templates: 'spec/views',
                     views: 'spec/views',
                   }

      get '/' do
        mustache :index
      end
    end
  }

  it 'looks up the template' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Around\nHello world\n\nAround\n")
  end
end
