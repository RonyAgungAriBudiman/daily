
<?php 

if(isset($_POST['Simpan']))
{	 
  $sql_cek ="SELECT UserID FROM ms_user WHERE UserID = '".$_POST['userid']."' ";
  $data_cek=$sqlLib->select($sql_cek);
  
  if(Count($data_cek)>'0')
  {
    $warning ='1';
    $note .= "Username Sudah Digunakan";
  }
  else
  {  
    $sql ="INSERT INTO ms_user (UserID, Password, Nama, Email, Admin) VALUES ('".$_POST['userid']."', '".$_POST['password']."', '".$_POST['nama']."', '".$_POST['email']."' , '".$_POST['admin']."')";
    $run =$sqlLib->insert($sql);
    
  }  
}


if(isset($_POST['Update']))
{
  $sql_upd ="UPDATE ms_user SET Nama ='".$_POST['nama']."', 
                                Email='".$_POST['email']."', 
                                Admin='".$_POST['admin']."'
                WHERE UserID = '".$_POST['userid']."'     ";
  $run_upd = $sqlLib->update($sql_upd);  
       
}

if(isset($_POST['Hapus']))
{
  $sql_delete = "DELETE FROM ms_user WHERE UserID = '".$_POST['userid']."' ";
  $run_delete = $sqlLib->delete($sql_delete);
}  


if($warning=="1")
{
  ?>
    <div class="alert alert-danger alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
    <h4><i class="icon fa fa-warning"></i> PERINGATAN !</h4>
    <?php echo $note?>
    </div>
    <?php 
} ?>     

<style type="text/css">
.dtHorizontalVerticalExampleWrapper {
max-width: 600px;
margin: 0 auto;
}
#dtHorizontalVerticalExample th, td {
white-space: nowrap;
}
table.dataTable thead .sorting:after,
table.dataTable thead .sorting:before,
table.dataTable thead .sorting_asc:after,
table.dataTable thead .sorting_asc:before,
table.dataTable thead .sorting_asc_disabled:after,
table.dataTable thead .sorting_asc_disabled:before,
table.dataTable thead .sorting_desc:after,
table.dataTable thead .sorting_desc:before,
table.dataTable thead .sorting_desc_disabled:after,
table.dataTable thead .sorting_desc_disabled:before {
bottom: .5em;
}
</style>

    <section class="content-header">
      <h1>
        Data User
      </h1>
     
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"></h3>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Tambah</button>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="dtHorizontalVerticalExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                <thead>
                <tr>
                  <th>UserID</th>
                  <th>Nama</th>
                  <th>Email</th>
                  <th>Level</th>
                  <th></th>
                  <th></th>
                </tr>
                </thead>
                <tbody>
                 <?php 
					$sql ="SELECT * FROM ms_user ";
					$data= $sqlLib->select($sql);
					foreach($data as $row)
					{  ?>		
						<tr>
							<td><?php echo $row["UserID"]?></td>
							<td><a href="index.php?m=activity&uid=<?php echo $row["UserID"]?>"><?php echo $row["Nama"]?></a></td>
							<td><?php echo $row["Email"]?></td>
							<td><?php echo $row["Admin"]?></td>
							<td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModaledit<?php echo $row['UserID']; ?>">Edit</button></td>
							<td>

								<form method="post">
								<input type="submit" name="Hapus" value="Hapus" class="btn btn-danger">
								<input type="hidden" name="userid" value="<?php echo $row["UserID"]?>">
								</form>
							</td>
						</tr>

						<div class="modal fade" id="exampleModaledit<?php echo $row['UserID']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
							<div class="modal-content">
							  <div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Data User</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								  <span aria-hidden="true">&times;</span>
								</button>
							  </div>
							  <?php
							  $sql="SELECT * FROM ms_user WHERE UserID ='".$row['UserID']."'" ;
							  $data= $sqlLib->select($sql);
							  ?>
							  <div class="modal-body">
								<form method="post">
								  <div class="form-group">
									<label for="username" class="col-form-label">UserID</label>
									<input type="text" class="form-control" id="userid" name="userid" readonly="readonly" value="<?php echo $data[0]['UserID'] ?>" >
								  </div>
								  <div class="form-group">
									<label for="nama" class="col-form-label">Nama</label>
									<input type="text" class="form-control" id="nama" name="nama" value="<?php echo $data[0]['Nama'] ?>">
								  </div>
								  <div class="form-group">
									<label for="email" class="col-form-label">Email</label>
									<input type="text" class="form-control" id="email" name="email" value="<?php echo $data[0]['Email'] ?>">
								  </div>

								  <div class="form-group">
									<label for="nama" class="col-form-label">Level</label>
									  <div >
										<select class="form-control" name="admin">

										  <option value="0"  <?php if($data[0]['Admin']=="0" ){ echo "selected";}?>>User</option>
										  <option value="1" <?php if($data[0]['Admin']=="1" ){ echo "selected";}?>>Admin</option>
										</select>
									  </div>
								  </div>
							  
							  </div>
							  <div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
								<input type="submit" name="Update" value="Update" class="btn btn-primary">
							  </div>
								</form>
							</div>
						  </div>
						</div> 

					<?php } ?>    
                
                </tbody>
                <tfoot>
                
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Tambah Data User</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form method="post">
	          <div class="form-group">
	            <label for="userid" class="col-form-label">UserID</label>
	            <input type="text" class="form-control" id="userid" name="userid">
	          </div>
	          <div class="form-group">
	            <label for="password" class="col-form-label">Password</label>
	            <input type="password" class="form-control" id="password" name="password">
	          </div>
	          <div class="form-group">
	            <label for="nama" class="col-form-label">Nama</label>
	            <input type="text" class="form-control" id="nama" name="nama">
	          </div>
	          <div class="form-group">
	            <label for="email" class="col-form-label">email</label>
	            <input type="text" class="form-control" id="email" name="email">
	          </div>

	          <div class="form-group">
	            <label for="nama" class="col-form-label">Level</label>
	              <div >
	                <select class="form-control" name="admin">
	                  <option value=""></option> 		
	                  <option value="0">User</option>
	                  <option value="1">Admin</option>
	                </select>
	              </div>
	          </div>
	      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
	        <input type="submit" name="Simpan" value="Simpan" class="btn btn-primary">
	      </div>
	        </form>
	    </div>
	  </div>
	</div>

  

<!-- DataTables -->
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<!-- page script -->
<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
</script>

<script type="text/javascript">
$(document).ready(function () {
$('#dtHorizontalVerticalExample').DataTable({
"scrollX": true,
"scrollY": 200,
});
$('.dataTables_length').addClass('bs-select');
});
</script>