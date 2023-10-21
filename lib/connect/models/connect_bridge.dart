class ConnectBridge{
    String? country;
    String? prefillEmail;
    String? redirectUrl;
    String? accessToken;

    ConnectBridge({
        this.country,
        this.prefillEmail,
        this.redirectUrl,
        this.accessToken
    });

    factory ConnectBridge.fromJson(Map<String, dynamic> json) {
        return ConnectBridge(
            country: json['country'] ?? '',
            prefillEmail: json['prefill_email'] ?? '',
            redirectUrl: json['redirect_url'] ?? '',
            accessToken: json['access_token'] ?? '',
        );
    }
}