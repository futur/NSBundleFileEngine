function NSBundleFileEngine() {}

NSBundleFileEngine.prototype.readPlistFile = function(plistKeys, success, fail) 
{
    return cordova.exec(success, fail, 'NSBundleFileEngine', 'readPlistFile', plistKeys);
}

/*
 * CAUTION: Writen data to the plist doesnt persist, it can be anyways used runtime alone. the data written is only to the in-memory collection. 
 */
NSBundleFileEngine.prototype.writeToPlistFileWithValues = function(plistObject,success,fail)
{
    return Cordova.exec(success,fail,'NSBundleFileEngine','writeToPlistFileWithValues',[plistObject]);
}

cordova.addConstructor(function() {
                       if(!window.plugins) window.plugins = {};
                       window.plugins.nsbundle = new NSBundleFileEngine();
                       });