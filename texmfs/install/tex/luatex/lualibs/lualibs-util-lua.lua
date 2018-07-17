if not modules then modules = { } end modules ['util-lua'] = {
    version   = 1.001,
    comment   = "companion to luat-lib.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    comment   = "the strip code is written by Peter Cawley",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

-- we will remove the 5.1 code some day soon

local rep, sub, byte, dump, format = string.rep, string.sub, string.byte, string.dump, string.format
local load, loadfile, type = load, loadfile, type

utilities          = utilities or {}
utilities.lua      = utilities.lua or { }
local luautilities = utilities.lua

local report_lua = logs.reporter("system","lua")

local tracestripping           = false
local forcestupidcompile       = true  -- use internal bytecode compiler
luautilities.stripcode         = true  -- support stripping when asked for
luautilities.alwaysstripcode   = false -- saves 1 meg on 7 meg compressed format file (2012.08.12)
luautilities.nofstrippedchunks = 0
luautilities.nofstrippedbytes  = 0
local strippedchunks           = { } -- allocate()
luautilities.strippedchunks    = strippedchunks

luautilities.suffixes = {
    tma = "tma",
    tmc = jit and "tmb" or "tmc",
    lua = "lua",
    luc = jit and "lub" or "luc",
    lui = "lui",
    luv = "luv",
    luj = "luj",
    tua = "tua",
    tuc = "tuc",
}

-- environment.loadpreprocessedfile can be set to a preprocessor

local function register(name)
    if tracestripping then
        report_lua("stripped bytecode from %a",name or "unknown")
    end
    strippedchunks[#strippedchunks+1] = name
    luautilities.nofstrippedchunks = luautilities.nofstrippedchunks + 1
end

local function stupidcompile(luafile,lucfile,strip)
    local code = io.loaddata(luafile)
    if code and code ~= "" then
        code = load(code)
        if code then
            code = dump(code,strip and luautilities.stripcode or luautilities.alwaysstripcode)
            if code and code ~= "" then
                register(name)
                io.savedata(lucfile,code)
                return true, 0
            end
        else
            report_lua("fatal error %a in file %a",1,luafile)
        end
    else
        report_lua("fatal error %a in file %a",2,luafile)
    end
    return false, 0
end

-- quite subtle ... doing this wrong incidentally can give more bytes

function luautilities.loadedluacode(fullname,forcestrip,name)
    -- quite subtle ... doing this wrong incidentally can give more bytes
    name = name or fullname
    local code, message
    if environment.loadpreprocessedfile then
        code, message = environment.loadpreprocessedfile(fullname)
    else
        code, message = loadfile(fullname)
    end
    if code then
        code()
    else
        report_lua("loading of file %a failed:\n\t%s",fullname,message or "no message")
    end
    if forcestrip and luautilities.stripcode then
        if type(forcestrip) == "function" then
            forcestrip = forcestrip(fullname)
        end
        if forcestrip or luautilities.alwaysstripcode then
            register(name)
            return load(dump(code,true)), 0
        else
            return code, 0
        end
    elseif luautilities.alwaysstripcode then
        register(name)
        return load(dump(code,true)), 0
    else
        return code, 0
    end
end

function luautilities.strippedloadstring(code,forcestrip,name) -- not executed
    local code, message = load(code)
    if not code then
        report_lua("loading of file %a failed:\n\t%s",name,message or "no message")
    end
    if forcestrip and luautilities.stripcode or luautilities.alwaysstripcode then
        register(name)
        return load(dump(code,true)), 0 -- not yet executes
    else
        return code, 0
    end
end

function luautilities.compile(luafile,lucfile,cleanup,strip,fallback) -- defaults: cleanup=false strip=true
    report_lua("compiling %a into %a",luafile,lucfile)
    os.remove(lucfile)
    local done = stupidcompile(luafile,lucfile,strip ~= false)
    if done then
        report_lua("dumping %a into %a stripped",luafile,lucfile)
        if cleanup == true and lfs.isfile(lucfile) and lfs.isfile(luafile) then
            report_lua("removing %a",luafile)
            os.remove(luafile)
        end
    end
    return done
end

function luautilities.loadstripped(...)
    local l = load(...)
    if l then
        return load(dump(l,true))
    end
end

-- local getmetatable, type = getmetatable, type
--
-- local types = { }
--
-- function luautilities.registerdatatype(d,name)
--     types[getmetatable(d)] = name
-- end
--
-- function luautilities.datatype(d)
--     local t = type(d)
--     if t == "userdata" then
--         local m = getmetatable(d)
--         return m and types[m] or "userdata"
--     else
--         return t
--     end
-- end
--
-- luautilities.registerdatatype(lpeg.P("!"),"lpeg")
--
-- print(luautilities.datatype(lpeg.P("oeps")))

-- These finalizers will only be invoked when we have a proper lua_close
-- call (which is not happening in luatex tex node yes) or finish with an
-- os.exit(n,true).

local finalizers = { }

setmetatable(finalizers, {
    __gc = function(t)
        for i=1,#t do
            pcall(t[i]) -- let's not crash
        end
    end
} )

function luautilities.registerfinalizer(f)
    finalizers[#finalizers+1] = f
end
