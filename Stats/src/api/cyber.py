from hashlib import sha512 # SHA = Secure Hashing Algorithm - sha512 is a powerful hashing algorithm.
from .app_config import AppConfig
# from rest_framework.authentication import BaseAuthentication
# from rest_framework.exceptions import AuthenticationFailed
# import jwt


class Cyber:

    @staticmethod
    def hash(plain_text):
        encoded_text = plain_text.encode("UTF-8") + AppConfig.passwords_salt.encode("UTF-8")
        hashed_text = sha512(encoded_text).hexdigest()
        return hashed_text


# class JWTAuthentication(BaseAuthentication):

#     def authenticate(self, request, view):
#         auth_header = request.META.get('HTTP_AUTHORIZATION')

#         if not auth_header or not auth_header.startswith('Bearer '):
#             return None  # Request doesn't have a valid authorization header

#         token = auth_header.split(' ')[1]

#         try:
#             decoded_payload = jwt.decode(token, AppConfig.jwt_secret_key, algorithms=['HS256'])
#             user_id = decoded_payload['user_id']  # Extract user ID for further use (optional)
#             return (user_id, None)  # Return user_id (or other relevant authentication object)

#         except jwt.ExpiredSignatureError:
#             raise AuthenticationFailed('Token is expired')
#         except jwt.InvalidTokenError:
#             raise AuthenticationFailed('Invalid token')
