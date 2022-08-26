<?php 
	class Dashboard{
		public function __construct(){}
		public function index(){			
			require_once 'views/roles/admin/header.php';
			require_once 'views/modules/0_mains/admin.main.view.php';
			require_once 'views/roles/admin/footer.php';
		}
		public function verPdf(){			
			// require_once 'views/business/alerts.view.php';
			require_once 'views/modules/4_mod_reports/reports_imp/demo.php';
		}
	}
?>