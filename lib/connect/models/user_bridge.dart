class UserBridge {
    String? uuid;
    String? email;
    String? accessToken;
    String? expiresAt;

    UserBridge({
        this.uuid,
        this.email,
        this.accessToken,
        this.expiresAt
    });


    // function to convert json data to user model
    factory UserBridge.fromJson(Map<String, dynamic> json) {
        return UserBridge(
            uuid: json['user']['uuid'] ?? '',
            email: json['user']['email'] ?? '',
            accessToken: json['access_token'] ?? '',
            expiresAt: json['expires_at'] ?? '',
        );
    }
}