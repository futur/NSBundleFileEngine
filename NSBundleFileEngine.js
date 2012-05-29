var NSBundleFileEngine = {
     readPlistFile: function(plistKeys, success, fail) {
          return PhoneGap.exec(success, fail, "NSBundleFileEngine", "readPlistFile", plistKeys);
     }
};