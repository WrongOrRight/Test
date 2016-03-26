<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ANGULAR page</title>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    </head>
    <body>
        <div ng-app="myApp" ng-controller="promotionCtrl"> 

            <ul>
                <li ng-repeat="x in promoData">
                    {{ x.Name + ', ' + x.Country}}
                </li>
            </ul>

        </div>

        <script>
            var app = angular.module('myApp', []);
            app.controller('promotionCtrl', function ($scope, $http) {
                $http.get("./promoList").then(function (response) {
                    $scope.promoData = response.data.records;
                });
            });
        </script>
    </body>
</html>
