<?php 
	class Dashboard{
		public function __construct(){}
		public function index(){			
			require_once 'views/roles/admin/header.php';
			require_once 'views/modules/0_mains/admin.main.view.php';
			require_once 'views/roles/admin/footer.php';
		}		
	}
?>