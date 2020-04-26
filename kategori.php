<?php 
require_once("header.php");
?>
  <div class="content-wrapper">
          <div class="row">
            
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Daftar Kategori</h4>
                  
                  <div class="table-responsive">
                    <table class="table table-hover table-striped">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Nama</th>
                          <th>Aksi</th>                          
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                            <?php
$result =  SimpleSelect("select id,nama from buku ");
if(mysqli_num_rows($result) > 0){   
        while($row = mysqli_fetch_array($result)){
            echo "<tr>";
                echo "<td>" . $row['id'] . "</td>";
                echo "<td>" . $row['nama'] . "</td>";
                echo "<td>
                  <button type='button' class='btn btn-primary btn-sm btn-rounded btn-icon'>
                <i class='ti-pencil-alt2 '></i>              </button>
                <button type='button' onclick=\"hapus('".$row["id"]."','".$row['nama']."')\" class='btn btn-danger btn-sm btn-rounded btn-icon'>
                <i class=' ti-minus  '></i>              </button>
                </td>";                
            echo "</tr>";
            
        }
        echo "</tbody>";                            
    echo "</table>";
    
    // Free result set
    mysqli_free_result($result);
} else{
    echo "<tr><td colspan='2'><p class='lead'><em>No records were found.</em></p></td></tr>";
}
                            ?>                    
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
        </div>

        <script>        

function hapus(id,nama){
    Swal.fire({
  title: 'Apakah anda yakin untuk menghapus '+ nama,
  text: 'Do you want to continue',
  icon: 'question',
  confirmButtonText: 'Cool', 
})

}

        </script>
<?php 
require_once("footer.php");
?>     