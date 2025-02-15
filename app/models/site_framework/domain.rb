module SiteFramework
  # This model represent a **Domain**. Each domain
  # belongs to a [Site] model and may or may not
  # belongs to another  **Domain**
  class Domain < (defined?(ActiveRecord) ? ActiveRecord::Base : Object)

    PATTERN = /\A[a-z0-9]*(\.?[a-z0-9]+)\.[a-z]{2,5}(:[0-9]{1,5})?(\/.)?$/ix

    if defined? Mongoid
      include Mongoid::Document
      include Mongoid::Timestamps

      field :name,   type: String
      field :parent, type: String,  default: nil
      field :alias,  type: Boolean, default: false

      embedded_in :site

      index({ name: 1 }, { unique: { case_sensitive: false }, background: true })

      def parent
        # TODO: return a domain with alias == false
      end
    end

    if defined? ActiveRecord
      belongs_to :site

      # Self relation
      belongs_to :parent, class_name: self.to_s, optional: true
      validates_associated :site
    end

    validates :name, presence: true, if: :valid_domain_name?
    validates_uniqueness_of :name, case_sensitive: false

    before_save :normalize_name

    def normalize_name
      self.name = name.downcase
    end

    def valid_domain_name?
      if read_attribute :alias
        false unless name =~ PATTERN
        # TODO: Check the owner of domain
      else
        true
      end
    end

  end
end
