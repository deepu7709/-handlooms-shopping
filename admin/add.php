<?php
session_start();
include('include/config.php');
if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
date_default_timezone_set('Asia/Kolkata');// change according timezone
$currentTime = date( 'd-m-Y h:i:s A', time () );

if(isset($_GET['del']))
		  {
		          mysqli_query($con,"delete from products where id = '".$_GET['id']."'");
                  $_SESSION['delmsg']="Product deleted !!";
		  }

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Manage Users</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</head>
<body>
<?php include('include/header.php');?>

	<div class="wrapper">
		<div class="container">
			<div class="row">
<?php include('include/sidebar.php');?>				
			<div class="span9">
					<div class="content">

	<div class="module">
							<div class="module-head">
								<h3>List of Most Popular fashion influencers on social media</h3>
							</div>
							<div class="module-body table">
	<?php if(isset($_GET['del']))
{?>
									<div class="alert alert-error">
										<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Oh snap!</strong> 	<?php echo htmlentities($_SESSION['delmsg']);?><?php echo htmlentities($_SESSION['delmsg']="");?>
									</div>
<?php } ?>

									<br />

							
								<table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display" width="100%">
									<thead>
										<tr>
											<th>#</th>
											<th> Name of influencer</th>
											<th>Email </th>
											<th>Contact no.</th>
											<th>social media platform</th>
											<th>social media account</th>
											<th></th>
										
										</tr>
										<tr>
											<td>1</td>
											<td> Ashnoor kaur</td>
											<td> ashcommisions@.email.com </td>
											<td>8279392393</td>
											<td>instagram</td>
											<td><a href='https://www.instagram.com/artsy_uha/'>@ashnoor_kaur</a></td>
											<td></td>
										
										</tr>
                                        <tr>
											<td>2</td>
											<td> Sakshi Shah</td>
											<td> sakshibusiness@.email.com </td>
											<td>8517637282</td>
											<td>youtube</td>
											<td><a href='https://www.youtube.com/@KBSKpop'>@Its_Sakshi</a></td>
											<td></td>
										
										</tr>
                                        <tr>
											<td>3</td>
											<td> anusha thripathi</td>
											<td> anushaaasha@.email.com </td>
											<td>85176300002</td>
											<td>youtube</td>
											<td><a href='https://www.youtube.com/@KBSKpop'>@Anusha_hauls</a></td>
											<td></td>
										
										</tr>
                                        <tr>
											<td>4</td>
											<td>Ruthvikh Paladugu </td>
											<td> rubu@.email.com </td>
											<td>9391619847</td>
											<td>reddit</td>
											<td><a href='https://www.youtube.com/@KBSKpop'>@RURUU</a></td>
											<td></td>
										
										</tr>
                                        <tr>
											<td>5</td>
											<td>Charan pillakaiyala</td>
											<td> churuchurun@.email.com </td>
											<td>8517699090</td>
											<td>instagram</td>
											<td><a href='https://www.youtube.com/@KBSKpop'>@Rodsingleindia</a></td>
											<td></td>
										
										</tr>
                                        <tr>
											<td>6</td>
											<td> gowthami bonula</td>
											<td> gomibonula@email.com </td>
											<td>865392729</td>
											<td>tiktok</td>
											<td><a href='https://www.youtube.com/@KBSKpop'>@gowtailors</a></td>
											<td></td>
										
										</tr>
                                        <tr>
											<td>7</td>
											<td> deepika kottana</td>
											<td> pichiverivenga@email.com </td>
											<td>98400281782</td>
											<td>tiktok</td>
											<td><a href='https://www.youtube.com/@KBSKpop'>@thepinkmoose</a></td>
											<td></td>
										
										</tr>
                                        
                                        
                                        
                                        
                                        </thead>

									<tbody>
<?php $query=mysqli_query($con,"select * from users");
$cnt=1;
while($row=mysqli_fetch_array($query))
{
?>									
										<tr>
											<td><?php echo htmlentities($cnt);?></td>
											<td><?php echo htmlentities($row['name']);?></td>
											<td><?php echo htmlentities($row['email']);?></td>
											<td> <?php echo htmlentities($row['contactno']);?></td>
											<td><?php echo htmlentities($row['shippingAddress'].",".$row['shippingCity'].",".$row['shippingState']."-".$row['shippingPincode']);?></td>
											<td><?php echo htmlentities($row['billingAddress'].",".$row['billingCity'].",".$row['billingState']."-".$row['billingPincode']);?></td>
											<td><?php echo htmlentities($row['regDate']);?></td>
											
										<?php $cnt=$cnt+1; } ?>
										
								</table>
							</div>
						</div>						

						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

<?php include('include/footer.php');?>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>
<?php } ?> 