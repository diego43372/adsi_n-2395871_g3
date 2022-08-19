<?php 
	class Landing{
		public function __construct(){}
		public function index(){			
			require_once 'views/roles/business/header.php';
			require_once 'views/business/index.view.php';
			require_once 'views/roles/business/footer.php';
		}
		public function programs(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/programs.view.php';
			require_once 'views/roles/business/footer.php';	
		}
		public function services(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/services.view.php';
			require_once 'views/roles/business/footer.php';	
		}
	}
?>