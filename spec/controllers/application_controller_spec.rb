RSpec.describe ApplicationController, type: :controller do
    controller do
      def index
        render plain: 'ok'
      end
    end
  
    it "sets locale correctly based on params for :en" do
      get :index, params: { locale: 'en' }
      expect(I18n.locale).to eq(:en)
    end

    it "sets locale correctly based on params for :pl" do
      get :index, params: { locale: 'pl' }
      expect(I18n.locale).to eq(:pl)
    end

    it "sets default_url_options with host based on request base_url" do
      request.host = 'example.com'
      get :index
      uri = URI.parse(Rails.application.routes.default_url_options[:host])
      expect(uri.host).to eq('example.com')
    end


    it "returns a hash with locale set to current I18n.locale" do
      I18n.locale = :en
      options = controller.send(:default_url_options)
      expect(options).to include(locale: :en)
    end
end
