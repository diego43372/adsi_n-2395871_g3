<?php 
	class Login{
		public function __construct(){}
		public function index(){			
			require_once 'views/roles/business/header.php';
			require_once 'views/business/login.view.php';
			require_once 'views/roles/business/footer.php';
		}
		public function routeSesion(){
			header('Location: ?c=Dashboard');
		}
	}
?>