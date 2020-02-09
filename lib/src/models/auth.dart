// {
//  "access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2NvdW50SWQiOjksImZpcnN0UGFnZVVybCI6bnVsbCwiYWNjb3VudE5hbWUiOiJuenN5c2FkbWluIiwidXNlcl9uYW1lIjoibnpzeXNhZG1pbiIsInNjb3BlIjpbInJlYWQiLCJ3cml0ZSJdLCJleHAiOjE1ODEyNjU3NzUsImF1dGhvcml0aWVzIjpbIlNZU0FETUlOIl0sImp0aSI6IjJiMGNlYWU0LWVjYzYtNDYzYy04ZDVhLTI4OTY0MjhjNTNlNCIsImNsaWVudF9pZCI6IndlYmFwcCJ9.IP8vn-y2SJuYpNXhgeIQK1D_4VsGJcfFuO_4PtcN0XU",
//  "token_type":"bearer",
//  "expires_in":28799,
//  "scope":"read write",
//  "accountId":9,
//  "firstPageUrl":null,
//  "accountName":"nzsysadmin",
//  "authorities":["SYSADMIN"],
//  "jti":"2b0ceae4-ecc6-463c-8d5a-2896428c53e4"
//  }

class Auth {
  final String access_token;
  final String token_type;
  final int expires_in;
  final String scope;
  final int accountId;
  final String firstPageUrl;
  final String accountName;
  final List<dynamic> authorities;
  final String jti;

  const Auth({
    this.access_token,
    this.token_type,
    this.expires_in,
    this.scope,
    this.accountId,
    this.firstPageUrl,
    this.accountName,
    this.authorities,
    this.jti,
  });

  static Auth fromJson(Map<String, dynamic> json) {
    final authorities = List<String>.from(json['authorities']);
    return Auth(
      access_token: json['access_token'] as String,
      token_type: json['token_type'] as String,
      expires_in: json['expires_in'] as int,
      scope: json['scope'] as String,
      accountId: json['accountId'] as int,
      firstPageUrl: json['firstPageUrl'] as String,
      accountName: json['accountName'] as String,
      authorities: authorities,
      jti: json['jti'] as String,
    );
  }
}