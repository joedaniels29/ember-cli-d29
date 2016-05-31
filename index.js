/* jshint node: true */
'use strict';

module.exports = {
  name: 'ember-cli-d29',

  included: function(app) {
    this._super.included(app);

    app.import(app.bowerDirectory + '/ember-validatiors/ember-validators.js');

    app.import(app.bowerDirectory + '/pikaday/css/pikaday.css');
    app.import(app.bowerDirectory + '/pikaday/pikaday.js');
    app.import(app.bowerDirectory + "/moment/moment.js");

    //app.import(app.bowerDirectory + "/nprogress/nprogress.js");
    //app.import(app.bowerDirectory + "/Lettering.js/index.js");
    app.import(app.bowerDirectory + "/nprogress/nprogress.js");
    app.import(app.bowerDirectory + "/nprogress/nprogress.css");
    //app.import(app.bowerDirectory + "/SimpleWebRTC/index.js");

    app.import(app.bowerDirectory + "/famouscss/index.css");
    app.import(app.bowerDirectory + "/sip.js/dist/sip.js");
    app.import(app.bowerDirectory + "/Simpl5/index.js");

    app.import(app.bowerDirectory + '/moment/moment.js');
    app.import(app.bowerDirectory + '/moment/locale/de-at.js');
    app.import(app.bowerDirectory + '/pikaday/pikaday.js');
    app.import(app.bowerDirectory + '/pikaday/css/pikaday.css');

// app.import(app.bowerDirectory + '/ember-easyForm/index.js');

    app.import({
      development: app.bowerDirectory + '/famous/index.js',
      production: app.bowerDirectory + '/famous.min/index.js'
    });

    app.import({
      development: app.bowerDirectory + '/animate.css/animate.css',
      production: app.bowerDirectory + '/animate.css/animate.min.css'
    });

    //app.import(app.bowerDirectory + '/Lettering.js/jquery.lettering.js');
    //app.import(app.bowerDirectory + '/textillate/jquery.textillate.js');
// app.import(app.bowerDirectory + '/ic-modal/dist/globals/main.js');
// app.import(app.bowerDirectory + '/ic-styled/main.js');


  }
};
