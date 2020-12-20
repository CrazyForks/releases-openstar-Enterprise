
-- version 0.1
local stool = require("stool")


-- 获取 openstar path
local old_base_path,new_base_path = arg[1],arg[2]
if old_base_path == nil then
    old_base_path = "/opt/openresty/openstar.bak/"
end
if new_base_path == nil then
    new_base_path = ngx.re.gsub(old_base_path,".bak/","/")
    -- like /opt/openresty/openstar/ | /opt/tengine/openstar/
end
local old_json_path = stool.pathJoin(old_base_path,"conf_json/")
local new_json_path = stool.pathJoin(new_base_path,"conf_json/")
-- ngx.say("取值的 conf_json 目录： ",old_json_path)
-- ngx.say("赋值的 conf_json 目录： ",new_json_path)

-- base.json
local function base_json_New()
    local old_path = stool.pathJoin(old_json_path,"base.json")
    local o_json = stool.loadjson(old_path)
    local new_path = stool.pathJoin(new_json_path,"base.json")
    local n_json = stool.loadjson(new_path)
    -- print("取值的 conf_json/base.json 目录： "..old_path.."\n")
    -- print("赋值的 conf_json/base.json 目录： "..new_path.."\n")
    -- 将老的 base.json 中的配置 赋值到 新的 base.json 中
    -- 为什么不直接覆盖？ 可能新的 base.json 中，一些 key 变动了
    -- 修改 redis_Mod ip port psd
    local o_redis_Mod = o_json["redis_Mod "] or {}
    n_json["redis_Mod"]["state"] = o_redis_Mod["state"] or "on"
    n_json["redis_Mod"]["ip"] = o_redis_Mod["ip"]
    n_json["redis_Mod"]["Port"] = o_redis_Mod["Port"] or 6379
    n_json["redis_Mod"]["Password"] = o_redis_Mod["Password"]

    -- 修改 autoSync
    local o_autoSync = o_json["autoSync"] or {}
    n_json["autoSync"]["state"] = o_autoSync["state"] or "Slave"
    n_json["autoSync"]["timeAt"] = o_autoSync["timeAt"] or 10
    n_json["autoSync"]["master"] = o_autoSync["master"]
    n_json["autoSync"]["slaves"] = o_autoSync["slaves"]
    n_json["autoSync"]["sync"]   = o_autoSync["sync"] or nil
     -- api_sign 暂时不修改了


    stool.writefile(new_path,stool.tableTojsonStr(n_json,true),"w+")
end

-- admin_Mod.json
local function admin_Mod_New()
    local old_path = stool.pathJoin(old_json_path,"admin_Mod.json")
    local o_json = stool.loadjson(old_path)
    local new_path = stool.pathJoin(new_json_path,"admin_Mod.json")
    local n_json = stool.loadjson(new_path)
    -- print("取值的 conf_json/admin_Mod.json 目录： "..old_path.."\n")
    -- print("赋值的 conf_json/admin_Mod.json 目录： "..new_path.."\n")
    -- 赋值 用户名 密码  jwt
    n_json["username"] = o_json["username"]
    n_json["password"] = o_json["password"]
    n_json["jwt_Mod"]  = o_json["jwt_Mod"]


    stool.writefile(new_path,stool.tableTojsonStr(n_json,true),"w+")
end

base_json_New()
admin_Mod_New()

print("resty 执行赋值成功(base.json admin_Mod.json)")