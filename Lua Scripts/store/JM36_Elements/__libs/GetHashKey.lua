local _GetHashKey = require('CreateCacheSimpleForFunction')(util.joaat)
GetHashKey, util.joaat = _GetHashKey, _GetHashKey
return _GetHashKey