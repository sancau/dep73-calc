angular.module( 'app.calculation', [
  'ui.router',
  'ui.bootstrap'
])

.config(function config( $stateProvider ) {
  $stateProvider.state( 'calculation', {
    url: '/calculation',
    views: {
      "main": {
        controller: 'ClimaticCtrl',
        templateUrl: 'calculation/views/calculation-view.html'
      }
    },
    data:{ pageTitle: 'Расчёт трудоёмкости' }
  });
})

;