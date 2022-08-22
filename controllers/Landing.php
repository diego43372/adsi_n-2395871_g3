<?php 
	class Landing{
		public function __construct(){}
		public function index(){			
			require_once 'views/roles/business/header.php';
			require_once 'views/business/index.view.php';
			require_once 'views/roles/business/footer.php';
		}
		public function login(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/login.view.php';
			require_once 'views/roles/business/footer.php';
		}
		public function register(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/register.view.php';
			require_once 'views/roles/business/footer.php';
		}
		public function forgot(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/forget.view.php';
			require_once 'views/roles/business/footer.php';
		}		
		public function tables(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/tables.view.php';
			require_once 'views/roles/business/footer.php';	
		}
		public function sweetAlert(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/alerts.view.php';
			require_once 'views/roles/business/footer.php';	
		}
		public function dataTables(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/dataTables.view.php';
			require_once 'views/roles/business/footer.php';	
		}
		public function byteScout(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/byteScout.view.php';
			require_once 'views/roles/business/footer.php';	
		}
		public function canvas(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/canvas.view.php';
			require_once 'views/roles/business/footer.php';	
		}
		public function fullCalendar(){
			require_once 'views/roles/business/header.php';
			require_once 'views/business/fullCalendar.view.php';
			require_once 'views/roles/business/footer.php';	
		}
	}
?>