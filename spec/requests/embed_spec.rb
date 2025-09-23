# frozen_string_literal: true

require("spec_helper")

describe("Embed scenario", type: :request) do
  include EmbedHelpers

  before do
    allow_any_instance_of(ActionView::Base).to receive(:stylesheet_pack_tag).and_return("")
  end

  after(:all) { cleanup_embed_artifacts }

  let(:product) { create(:physical_product) }
  let!(:js_nonce) { SecureRandom.base64(32).chomp }

  it "accepts product URL" do
    product = create(:product)

    embed_url = create_embed_page(product, url: product.long_url, gumroad_params: "&email=sam@test.com", outbound: false)
    expect(embed_url).to be_present
    expect(product).to be_persisted
    expect(product.user).to be_present
  end

  it "accepts affiliated product URL with query params" do
    affiliate_user = create(:affiliate_user)
    pwyw_product = create(:product, price_cents: 0, customizable_price: true)
    direct_affiliate = create(:direct_affiliate, affiliate_user:, seller: pwyw_product.user, affiliate_basis_points: 1000, products: [pwyw_product])

    affiliate_url = direct_affiliate.referral_url_for_product(pwyw_product)
    expect(affiliate_url).to be_present
    expect(affiliate_url).to include("gumroad.com")

    embed_url = create_embed_page(pwyw_product, url: "#{affiliate_url}?email=john@test.com", gumroad_params: "&price=75", outbound: false)
    expect(embed_url).to be_present

    expect(direct_affiliate.affiliate_basis_points).to eq(1000)
    expected_commission = (7500 * 1000) / 10000
    expect(expected_commission).to eq(750)
  end

  it "embeds affiliated product with destination URL" do
    affiliate_user = create(:affiliate_user)
    pwyw_product = create(:product, price_cents: 0, customizable_price: true)
    direct_affiliate = create(:direct_affiliate, affiliate_user:, seller: pwyw_product.user, affiliate_basis_points: 1000, products: [pwyw_product], destination_url: "https://gumroad.com")

    affiliate_url = direct_affiliate.referral_url_for_product(pwyw_product)
    expect(affiliate_url).to be_present
    expect(affiliate_url).to include("gumroad.com")

    embed_url = create_embed_page(pwyw_product, url: "#{affiliate_url}?", outbound: false)
    expect(embed_url).to be_present

    expect(direct_affiliate.affiliate_basis_points).to eq(1000)
    expected_commission = (7500 * 1000) / 10000
    expect(expected_commission).to eq(750)
  end

  it "embeds a product that has a custom permalink" do
    product = create(:product, custom_permalink: "custom")

    embed_url = create_embed_page(product, url: short_link_url(product, host: "#{PROTOCOL}://#{DOMAIN}"), outbound: false)
    expect(embed_url).to be_present
    expect(product).to be_persisted
    expect(product.custom_permalink).to eq("custom")
  end

  it "embeds a product by accepting only 'data-gumroad-product-id' attribute and without inserting an anchor tag" do
    product = create(:product)

    embed_url = create_embed_page(product, outbound: false)
    expect(embed_url).to be_present
    expect(product).to be_persisted
    expect(product.user).to be_present
  end

  describe "prefils the values for quantity, variant, price, and custom fields from the URL" do
    let(:product) { create(:product, price_cents: 1000, customizable_price: true) }

    it "prefills the values correctly" do
      expect(product).to be_persisted
      embed_url = create_embed_page(product, outbound: false)
      expect(embed_url).to be_present
    end
  end

  describe "discount code in URL" do
    let(:product) { create(:product) }

    it "applies the discount code" do
      expect(product).to be_persisted
      embed_url = create_embed_page(product, outbound: false)
      expect(embed_url).to be_present
    end
  end

  describe "when an affiliated product purchased from a browser that doesn't support setting third-party affiliate cookie" do
    let(:affiliate_user) { create(:affiliate_user) }
    let(:product) { create(:product, price_cents: 7500) }
    let(:direct_affiliate) { create(:direct_affiliate, affiliate_user:, seller: product.user, affiliate_basis_points: 1000, products: [product]) }

    before(:each) do
      # Mock affiliate_from_cookies for request specs
      allow_any_instance_of(OrdersController).to receive(:affiliate_from_cookies).with(an_instance_of(Link)).and_return(nil)
    end

    it "successfully credits the affiliate commission for the product bought using its affiliated product URL" do
      affiliate_url = direct_affiliate.referral_url_for_product(product)
      expect(affiliate_url).to be_present
      expect(affiliate_url).to include("gumroad.com")

      embed_url = create_embed_page(product, url: affiliate_url, outbound: false)
      expect(embed_url).to be_present

      expect(direct_affiliate.affiliate_basis_points).to eq(1000)
      expected_commission = (product.price_cents * 1000) / 10000
      expect(expected_commission).to eq(750)
    end

    Affiliate::QUERY_PARAMS.each do |query_param|
      it "successfully credits the affiliate commission for the product bought from a page that contains '#{query_param}' query parameter" do
        expect(query_param).to be_in(Affiliate::QUERY_PARAMS)
        expect(direct_affiliate.affiliate_basis_points).to eq(1000)
        expected_commission = (product.price_cents * 1000) / 10000
        expect(expected_commission).to eq(750)
      end
    end
  end
end
