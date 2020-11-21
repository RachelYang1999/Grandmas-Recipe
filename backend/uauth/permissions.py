from user.models import User
from rest_framework.permissions import BasePermission

class IsSuperUser(BasePermission):
    def has_permission(self, request, view):
        if request.method == 'GET':
            if isinstance(request.user, User):
                return request.user.is_super
            return False
        return True