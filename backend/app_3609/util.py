import random
from hashlib import md5

def create_salt(length=8):
    salt = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    len_chars = len(chars) - 1
    for index in range(length):
        salt += chars[random.randint(0, len_chars)]
    return salt

def create_md5(pwd, salt):
    md5_obj = md5()
    pwd = pwd.encode('utf-8')
    salt = salt.encode('utf-8')
    md5_obj.update(pwd)
    pwd = md5_obj.hexdigest()
    md5_obj.update(salt)
    salt = md5_obj.hexdigest()
    md5_obj.update(pwd.encode('utf-8') + salt.encode('utf-8'))
    return md5_obj.hexdigest()
