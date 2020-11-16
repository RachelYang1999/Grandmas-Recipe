import random
from hashlib import md5
import time

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

def compare_time(time1,time2):
    s_time = time.mktime(time.strptime(time1,'%Y-%m-%d'))
    e_time = time.mktime(time.strptime(time2,'%Y-%m-%d'))
    # print('s_time is:',s_time)
    # print('e_time is:',e_time)
    if int(s_time) - int(e_time) > 0:
        return time2,time1
    elif int(s_time) - int(e_time) < 0:
        return time1,time2

def get_response(code,msg,data):
    dic={ "code": 0,"msg": "","data":None}
    dic["code"]=code
    dic["msg"]=msg
    dic["data"]=data

    return dic

