module Spree
  class BillingIntegration::OpenpayGateway::Cash < Gateway
    preference :auth_token, :string
    preference :source_method, :string, default: 'cash'

    unless Rails::VERSION::MAJOR == 4
      attr_accessible :preferred_auth_token, :preferred_source_method, :gateway_response
    end

    def provider_class
      Spree::Openpay::Provider
    end

    def payment_source_class
      Spree::OpenpayPayment
    end

    def method_type
      'conekta'
    end

    def card?
      false
    end

    def auto_capture?
      false
    end
  end
end
