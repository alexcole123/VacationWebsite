from django.utils import timezone
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import HolidaysModel, LikesModel, UserModel, UserSerializer
from rest_framework import status
from django.db.models import Count
from rest_framework_simplejwt.tokens import RefreshToken
from .cyber import Cyber  # Import your Cyber class here
from rest_framework.permissions import AllowAny
from rest_framework.decorators import permission_classes



# View to get past dates, current dates, and future dates for holidays
@api_view(["GET"])
def get_holidays_dates(request):
    try:
        if not request.session.get("is_logged_in", False):
            return Response({"error": "You are not logged-in!"}, status=status.HTTP_401_UNAUTHORIZED)

        current_date = timezone.now().date()

        past_holidays = HolidaysModel.objects.filter(end_date__lt=current_date).count()
        current_holidays = HolidaysModel.objects.filter(start_date__lte=current_date, end_date__gte=current_date).count()
        future_holidays = HolidaysModel.objects.filter(start_date__gt=current_date).count()

        json_data = {
            "past_holidays": past_holidays,
            "current_holidays": current_holidays,
            "future_holidays": future_holidays
        }

        return Response(json_data, status=status.HTTP_200_OK)
    except Exception as err:
        return Response({"error": str(err)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# -----------------------------------------------------------------------------------------------------------------------

# View to get total users in DB
@api_view(["GET"])
def total_users(request):
    try:
        if not request.session.get("is_logged_in", False):
            return Response({"error": "You are not logged-in!"}, status=status.HTTP_401_UNAUTHORIZED)

        total_user = UserModel.objects.count()


        json_users = {
            "total_users": total_user
        }

        return Response(json_users, status=status.HTTP_200_OK)
    except Exception as err:
        return Response({"error": str(err)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# -----------------------------------------------------------------------------------------------------------------------


# View for total likes in DB
@api_view(["GET"])
def total_likes(request):
    try:
        if not request.session.get("is_logged_in", False):
            return Response({"error": "You are not logged-in!"}, status=status.HTTP_401_UNAUTHORIZED)

        total_likes = LikesModel.objects.count()

        json_users = {
            "total_likes": total_likes
        }

        return Response(json_users, status=status.HTTP_200_OK)
    except Exception as err:
        return Response({"error": str(err)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# -----------------------------------------------------------------------------------------------------------------------


# View to get likes per destination in DB
@api_view(["GET"])
def get_cities_with_likes(request):
    try:
        if not request.session.get("is_logged_in", False):
            return Response({"error": "You are not logged-in!"}, status=status.HTTP_401_UNAUTHORIZED)

        likes_count_and_cities = LikesModel.objects.values("holiday_id__city_id__city").annotate(likes=Count("holiday_id"))

        response_data = [{"destination": item["holiday_id__city_id__city"], "likes": item["likes"]} for item in likes_count_and_cities]

        return Response(response_data)
    except Exception as err:
        return Response({"error": str(err)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# -----------------------------------------------------------------------------------------------------------------------


# Login view
@api_view(["POST"])
@permission_classes([AllowAny])
def log_in(request):
    try:
        email = request.data.get('email')
        password = request.data.get('password')
        
        if not email:
            return Response({"error": "Email is required"}, status=status.HTTP_400_BAD_REQUEST)
        
        try:
            user = UserModel.objects.get(email=email)
        except UserModel.DoesNotExist:
            return Response({"error": "Incorrect email or password"}, status=status.HTTP_404_NOT_FOUND)
        
        if not password:
            return Response({"error": "Password is required"}, status=status.HTTP_400_BAD_REQUEST)

        if Cyber.hash(password) != user.password:
            return Response({"error": "Incorrect email or password"}, status=status.HTTP_401_UNAUTHORIZED)

        if not user or not Cyber.hash(password) == user.password:
            return Response({"error": "Incorrect email or password"}, status=status.HTTP_401_UNAUTHORIZED)

        if user.role.name != "Admin":
            return Response({"error": "You are not authorized!!"}, status=status.HTTP_403_FORBIDDEN)

        # Generate JWT tokens
        refresh = RefreshToken.for_user(user)
        access_token = str(refresh.access_token)
        refresh_token = str(refresh)

        request.session["is_logged_in"] = True

        # Use the serializer to exclude the password field
        serializer = UserSerializer(user)
        user_data = serializer.data
        user_data.pop('password', None)

        return Response({
            "access": access_token,
            "refresh": refresh_token,
            "user": user_data
        }, status=status.HTTP_200_OK)

    except UserModel.DoesNotExist:
        return Response({"error": "User does not exist"}, status=status.HTTP_404_NOT_FOUND)
    except Exception as err:
        return Response({"error": str(err)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# -----------------------------------------------------------------------------------------------------------------------


@api_view(["POST"])
def log_out(request):
    try:
        request.session.flush()
        return Response({"message": "Logged out successfully."}, status=status.HTTP_200_OK)
    except Exception as err:
        return Response({"error": str(err)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
