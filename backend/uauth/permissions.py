from uauth.models import User
from rest_framework.permissions import BasePermission


# BasePermission是rest_framework里权限管理的基类
class IsSuperUser(BasePermission):
    def has_permission(self, request, view):
        # get请求获取数据是才验证权限，post等可能是注册或者登录，应该放开访问权限
        if request.method == 'GET':
            if isinstance(request.user, User):
                return request.user.is_super
            return False
        return True