#
# The monkey patching dependency injector! 
#
monkey =
    # `patch` takes an object and changes properties inside it
    #
    patch: (obj, patches) ->
        t = typeof obj
        throw 'unpatchable' unless "string" == t or "object" == t or "function" == t
        
        # keep some references around for unpatching
        throw 'err: already been monkey patched' if obj.___monkey?
        obj.___monkey = {}
        for name, replacement of patches
            continue unless obj[name]?
            obj.___monkey[name] = obj[name]
            obj[name] = replacement
        
        obj
    
    # `unpatch` undos all the monkeying we've done before
    unpatch: (obj) ->
        return unless obj.___monkey?
        obj[name] = original for name,original of obj.___monkey
        delete obj.___monkey

module.exports = monkey
