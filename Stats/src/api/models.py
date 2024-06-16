from django.db.models import Model, DateField, ForeignKey, CASCADE, CharField, EmailField
from rest_framework.serializers import ModelSerializer


class CitiesModel(Model):
    city = CharField(max_length=100)

    class Meta:
        db_table = "cities"


class CitiesSerializer(ModelSerializer):
    class Meta:
        model = CitiesModel
        fields = "__all__"

# ----------------------------------------------

class HolidaysModel(Model):
    city = ForeignKey(CitiesModel, on_delete=CASCADE)
    start_date = DateField()
    end_date = DateField()

    class Meta:
        db_table = "holidays"


class HolidaysSerializer(ModelSerializer):
    class Meta:
        model = HolidaysModel
        fields = "__all__"




# ----------------------------------------------


class RoleModel(Model):
    ADMIN = 'admin'
    USER = 'user'
    
    ROLE_CHOICES = [
        (ADMIN, 'Admin'),
        (USER, 'User'),
    ]
    
    name = CharField(max_length=100, choices=ROLE_CHOICES)

    class Meta:
        db_table = "roles"



# ----------------------------------------------

class UserModel(Model):
    first_name = CharField(max_length=100)
    last_name = CharField(max_length=100)
    email = EmailField()
    password = CharField(max_length=128)  
    role = ForeignKey(RoleModel, on_delete=CASCADE)


    class Meta:
        db_table = "users"


class UserSerializer(ModelSerializer):
    class Meta:
        model = UserModel
        fields = "__all__"


# ----------------------------------------------


class LikesModel(Model):
    user = ForeignKey(UserModel, on_delete=CASCADE)
    holiday = ForeignKey(HolidaysModel, on_delete=CASCADE)

    class Meta:
        db_table = "likes"
        unique_together = ("user", "holiday")


class LikesSerializer(ModelSerializer):
    class Meta:
        model = LikesModel
        fields = "__all__"


