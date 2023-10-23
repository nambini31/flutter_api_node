class User {
    String? uuid;
    String? email;
    String? accessToken;
    String? expiresAt;

    User({
        this.uuid,
        this.email,
        this.accessToken,
        this.expiresAt
    });


    // function to convert json data to user model
    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            uuid: json['user']['uuid'] ?? '',
            email: json['user']['email'] ?? '',
            accessToken: json['access_token'] ?? '',
            expiresAt: json['expires_at'] ?? '',
        );
    }
}