class CheckOutModel {
  CheckOutModel({
    required this.status,
    required this.session,
  });

  final String? status;
  final Session? session;

  factory CheckOutModel.fromJson(Map<String, dynamic> json) {
    return CheckOutModel(
      status: json["status"],
      session:
          json["session"] == null ? null : Session.fromJson(json["session"]),
    );
  }
}

class Session {
  Session({
    required this.id,
    required this.object,
    required this.afterExpiration,
    required this.allowPromotionCodes,
    required this.amountSubtotal,
    required this.amountTotal,
    required this.automaticTax,
    required this.billingAddressCollection,
    required this.cancelUrl,
    required this.clientReferenceId,
    required this.clientSecret,
    required this.consent,
    required this.consentCollection,
    required this.created,
    required this.currency,
    required this.currencyConversion,
    required this.customFields,
    required this.customText,
    required this.customer,
    required this.customerCreation,
    required this.customerDetails,
    required this.customerEmail,
    required this.expiresAt,
    required this.invoice,
    required this.invoiceCreation,
    required this.livemode,
    required this.locale,
    required this.metadata,
    required this.mode,
    required this.paymentIntent,
    required this.paymentLink,
    required this.paymentMethodCollection,
    required this.paymentMethodConfigurationDetails,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    required this.paymentStatus,
    required this.phoneNumberCollection,
    required this.recoveredFrom,
    required this.savedPaymentMethodOptions,
    required this.setupIntent,
    required this.shippingAddressCollection,
    required this.shippingCost,
    required this.shippingDetails,
    required this.shippingOptions,
    required this.status,
    required this.submitType,
    required this.subscription,
    required this.successUrl,
    required this.totalDetails,
    required this.uiMode,
    required this.url,
  });

  final String? id;
  final String? object;
  final dynamic afterExpiration;
  final dynamic allowPromotionCodes;
  final int? amountSubtotal;
  final int? amountTotal;
  final AutomaticTax? automaticTax;
  final dynamic billingAddressCollection;
  final String? cancelUrl;
  final String? clientReferenceId;
  final dynamic clientSecret;
  final dynamic consent;
  final dynamic consentCollection;
  final int? created;
  final String? currency;
  final dynamic currencyConversion;
  final List<dynamic> customFields;
  final CustomText? customText;
  final dynamic customer;
  final String? customerCreation;
  final CustomerDetails? customerDetails;
  final String? customerEmail;
  final int? expiresAt;
  final dynamic invoice;
  final InvoiceCreation? invoiceCreation;
  final bool? livemode;
  final dynamic locale;
  final Metadata? metadata;
  final String? mode;
  final dynamic paymentIntent;
  final dynamic paymentLink;
  final String? paymentMethodCollection;
  final dynamic paymentMethodConfigurationDetails;
  final PaymentMethodOptions? paymentMethodOptions;
  final List<String> paymentMethodTypes;
  final String? paymentStatus;
  final PhoneNumberCollection? phoneNumberCollection;
  final dynamic recoveredFrom;
  final dynamic savedPaymentMethodOptions;
  final dynamic setupIntent;
  final dynamic shippingAddressCollection;
  final dynamic shippingCost;
  final dynamic shippingDetails;
  final List<dynamic> shippingOptions;
  final String? status;
  final dynamic submitType;
  final dynamic subscription;
  final String? successUrl;
  final TotalDetails? totalDetails;
  final String? uiMode;
  final String? url;

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json["id"],
      object: json["object"],
      afterExpiration: json["after_expiration"],
      allowPromotionCodes: json["allow_promotion_codes"],
      amountSubtotal: json["amount_subtotal"],
      amountTotal: json["amount_total"],
      automaticTax: json["automatic_tax"] == null
          ? null
          : AutomaticTax.fromJson(json["automatic_tax"]),
      billingAddressCollection: json["billing_address_collection"],
      cancelUrl: json["cancel_url"],
      clientReferenceId: json["client_reference_id"],
      clientSecret: json["client_secret"],
      consent: json["consent"],
      consentCollection: json["consent_collection"],
      created: json["created"],
      currency: json["currency"],
      currencyConversion: json["currency_conversion"],
      customFields: json["custom_fields"] == null
          ? []
          : List<dynamic>.from(json["custom_fields"]!.map((x) => x)),
      customText: json["custom_text"] == null
          ? null
          : CustomText.fromJson(json["custom_text"]),
      customer: json["customer"],
      customerCreation: json["customer_creation"],
      customerDetails: json["customer_details"] == null
          ? null
          : CustomerDetails.fromJson(json["customer_details"]),
      customerEmail: json["customer_email"],
      expiresAt: json["expires_at"],
      invoice: json["invoice"],
      invoiceCreation: json["invoice_creation"] == null
          ? null
          : InvoiceCreation.fromJson(json["invoice_creation"]),
      livemode: json["livemode"],
      locale: json["locale"],
      metadata:
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      mode: json["mode"],
      paymentIntent: json["payment_intent"],
      paymentLink: json["payment_link"],
      paymentMethodCollection: json["payment_method_collection"],
      paymentMethodConfigurationDetails:
          json["payment_method_configuration_details"],
      paymentMethodOptions: json["payment_method_options"] == null
          ? null
          : PaymentMethodOptions.fromJson(json["payment_method_options"]),
      paymentMethodTypes: json["payment_method_types"] == null
          ? []
          : List<String>.from(json["payment_method_types"]!.map((x) => x)),
      paymentStatus: json["payment_status"],
      phoneNumberCollection: json["phone_number_collection"] == null
          ? null
          : PhoneNumberCollection.fromJson(json["phone_number_collection"]),
      recoveredFrom: json["recovered_from"],
      savedPaymentMethodOptions: json["saved_payment_method_options"],
      setupIntent: json["setup_intent"],
      shippingAddressCollection: json["shipping_address_collection"],
      shippingCost: json["shipping_cost"],
      shippingDetails: json["shipping_details"],
      shippingOptions: json["shipping_options"] == null
          ? []
          : List<dynamic>.from(json["shipping_options"]!.map((x) => x)),
      status: json["status"],
      submitType: json["submit_type"],
      subscription: json["subscription"],
      successUrl: json["success_url"],
      totalDetails: json["total_details"] == null
          ? null
          : TotalDetails.fromJson(json["total_details"]),
      uiMode: json["ui_mode"],
      url: json["url"],
    );
  }
}

class AutomaticTax {
  AutomaticTax({
    required this.enabled,
    required this.liability,
    required this.status,
  });

  final bool? enabled;
  final dynamic liability;
  final dynamic status;

  factory AutomaticTax.fromJson(Map<String, dynamic> json) {
    return AutomaticTax(
      enabled: json["enabled"],
      liability: json["liability"],
      status: json["status"],
    );
  }
}

class CustomText {
  CustomText({
    required this.afterSubmit,
    required this.shippingAddress,
    required this.submit,
    required this.termsOfServiceAcceptance,
  });

  final dynamic afterSubmit;
  final dynamic shippingAddress;
  final dynamic submit;
  final dynamic termsOfServiceAcceptance;

  factory CustomText.fromJson(Map<String, dynamic> json) {
    return CustomText(
      afterSubmit: json["after_submit"],
      shippingAddress: json["shipping_address"],
      submit: json["submit"],
      termsOfServiceAcceptance: json["terms_of_service_acceptance"],
    );
  }
}

class CustomerDetails {
  CustomerDetails({
    required this.address,
    required this.email,
    required this.name,
    required this.phone,
    required this.taxExempt,
    required this.taxIds,
  });

  final dynamic address;
  final String? email;
  final dynamic name;
  final dynamic phone;
  final String? taxExempt;
  final dynamic taxIds;

  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return CustomerDetails(
      address: json["address"],
      email: json["email"],
      name: json["name"],
      phone: json["phone"],
      taxExempt: json["tax_exempt"],
      taxIds: json["tax_ids"],
    );
  }
}

class InvoiceCreation {
  InvoiceCreation({
    required this.enabled,
    required this.invoiceData,
  });

  final bool? enabled;
  final InvoiceData? invoiceData;

  factory InvoiceCreation.fromJson(Map<String, dynamic> json) {
    return InvoiceCreation(
      enabled: json["enabled"],
      invoiceData: json["invoice_data"] == null
          ? null
          : InvoiceData.fromJson(json["invoice_data"]),
    );
  }
}

class InvoiceData {
  InvoiceData({
    required this.accountTaxIds,
    required this.customFields,
    required this.description,
    required this.footer,
    required this.issuer,
    required this.metadata,
    required this.renderingOptions,
  });

  final dynamic accountTaxIds;
  final dynamic customFields;
  final dynamic description;
  final dynamic footer;
  final dynamic issuer;
  final Metadata? metadata;
  final dynamic renderingOptions;

  factory InvoiceData.fromJson(Map<String, dynamic> json) {
    return InvoiceData(
      accountTaxIds: json["account_tax_ids"],
      customFields: json["custom_fields"],
      description: json["description"],
      footer: json["footer"],
      issuer: json["issuer"],
      metadata:
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      renderingOptions: json["rendering_options"],
    );
  }
}

class Metadata {
  Metadata({required this.json});
  final Map<String, dynamic> json;

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(json: json);
  }
}

class PaymentMethodOptions {
  PaymentMethodOptions({
    required this.card,
  });

  final Card? card;

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      card: json["card"] == null ? null : Card.fromJson(json["card"]),
    );
  }
}

class Card {
  Card({
    required this.requestThreeDSecure,
  });

  final String? requestThreeDSecure;

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      requestThreeDSecure: json["request_three_d_secure"],
    );
  }
}

class PhoneNumberCollection {
  PhoneNumberCollection({
    required this.enabled,
  });

  final bool? enabled;

  factory PhoneNumberCollection.fromJson(Map<String, dynamic> json) {
    return PhoneNumberCollection(
      enabled: json["enabled"],
    );
  }
}

class TotalDetails {
  TotalDetails({
    required this.amountDiscount,
    required this.amountShipping,
    required this.amountTax,
  });

  final int? amountDiscount;
  final int? amountShipping;
  final int? amountTax;

  factory TotalDetails.fromJson(Map<String, dynamic> json) {
    return TotalDetails(
      amountDiscount: json["amount_discount"],
      amountShipping: json["amount_shipping"],
      amountTax: json["amount_tax"],
    );
  }
}
