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
		public function directory(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/directory.view.php';
			require_once 'views/roles/business/footer.php';	
		}
		public function entity(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/entity.view.php';
			require_once 'views/roles/business/footer.php';	
		}
		public function organization(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/organization.view.php';
			require_once 'views/roles/business/footer.php';	
		}
		public function library(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/library.view.php';
			require_once 'views/roles/business/footer.php';	
		}
	}
?>