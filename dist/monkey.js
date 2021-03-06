// Generated by CoffeeScript 1.3.3
var monkey;

monkey = {
  patch: function(obj, patches) {
    var name, replacement, t;
    t = typeof obj;
    if (!("string" === t || "object" === t || "function" === t)) {
      throw 'unpatchable';
    }
    if (obj.___monkey != null) {
      throw 'err: already been monkey patched';
    }
    obj.___monkey = {};
    for (name in patches) {
      replacement = patches[name];
      if (obj[name] == null) {
        continue;
      }
      obj.___monkey[name] = obj[name];
      obj[name] = replacement;
    }
    return obj;
  },
  unpatch: function(obj) {
    var name, original, _ref;
    if (obj.___monkey == null) {
      return;
    }
    _ref = obj.___monkey;
    for (name in _ref) {
      original = _ref[name];
      obj[name] = original;
    }
    return delete obj.___monkey;
  }
};

module.exports = monkey;
