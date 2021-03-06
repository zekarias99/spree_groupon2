Product.class_eval do

  has_many :conditions, :dependent => :destroy
  has_many :features, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :confirmed_comments, :class_name=>"Comment", :conditions=>{:confirmed=>true}


  scope :available_coupon, lambda{ where(" :date between available_on and available_till ", :date => Time.now)}

  scope :recently_coupon, lambda{ where(" available_till <= :date ", :date => Time.now) }

  scope :for_state, lambda{|state_id| where(" state_id = :state_id", :state_id  => state_id)}

  scope :current_groupon, lambda{
    where("available_till > :date AND available_on <= :date", :date => Time.now)
  }

  scope :featured, where(:featured => true )

  attr_accessible :name, :description, :price, :cost_price, :discount, :available_on, :sku,
    :on_hand, :action_type, :state_id, :permalink, :conditions, :conditions_attributes,
    :features, :features_attributes, :available_on, :available_till, :featured

  validates_presence_of :discount, :state_id, :description, :on_hand, :action_type
  validates_numericality_of :on_hand, :only_integer => true, :greater_than => 0,
    :message => :must_be_greater_than_zero

  validate :presence_of_conditions
  validate :presence_of_features

  accepts_nested_attributes_for :conditions,    :allow_destroy => true
  accepts_nested_attributes_for :features,    :allow_destroy => true

  class << self
    def find_all_in_state(state_abbr)
      state = State.find_by_abbr(state_abbr)
      self.find_all_by_state_id(state.id)
    end

    # Рассылка о новых акция подписынным пользователям
    #
    #
    def subscription
      Profile.daily_subscription.map{ |profile|
        if @user = profile.user
          @coupons = Product.available_coupon.for_state(@user.state.try(:id))
          if @current_coupon = Product.featured.for_state(@user.state.try(:id)).first || @coupons.first
            UserMailer.subscription_coupons(@user, @current_coupon, @coupons).deliver
          end
        end
      }
    end

  end

  private
  def before_create
    self.available_on=Time.zone.now.to_s(:db)
  end

  def presence_of_conditions
    if conditions.empty? or conditions.all? {|condition| condition.marked_for_destruction? }
      errors[:base] << I18n.t(:must_have_at_least_one_condition)
    end
  end

  def presence_of_features
    if features.empty? or features.all? {|feature| feature.marked_for_destruction? }
      errors[:base] << I18n.t(:must_have_at_least_one_feature)
    end
  end

end
