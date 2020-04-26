<?php 
require_once("header.php");
?>
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="d-flex justify-content-between align-items-center">
                <div>
                  <h4 class="font-weight-bold mb-0">Selamat Datang <?php echo ucwords( $_SESSION['nama']); ?></h4>
                </div>
                
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-3 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title text-md-center text-xl-left">Buku</p>
                  <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">
                    <?php                          
                             
                            $result =  SimpleSelect("select count(*) as jml from buku ");
                            $row = mysqli_fetch_array($result);
                            echo $row[0];
                            mysqli_free_result($result);
                    ?>
                    </h3>
                    <i class="ti-book icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                  </div>  
                  
                </div>
              </div>
            </div>
            <div class="col-md-3 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title text-md-center text-xl-left">User</p>
                  <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">
                    <?php                          
                             
                             $result =  SimpleSelect("select count(*) as jml from user ");
                             $row = mysqli_fetch_array($result);
                             echo $row["jml"];
                             mysqli_free_result($result);
                     ?>                    
                    </h3>
                    <i class="ti-user icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                  </div>  
                 
                </div>
              </div>
            </div>
            <div class="col-md-3 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title text-md-center text-xl-left">Pinjaman Aktif</p>
                  <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">
                    <?php                                                       
                      $result =  SimpleSelect("select count(*) as jml from peminjam where tanggalkembali < tanggalpinjam ");
                      $row = mysqli_fetch_array($result);
                      echo $row["jml"];
                      mysqli_free_result($result);
                     ?>      
                    </h3>
                    <i class="ti-agenda icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                  </div>                    
                </div>
              </div>
            </div>
            <div class="col-md-3 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title text-md-center text-xl-left">Denda Belum dibayar</p>
                  <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                    <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">
                    <?php                                                       
                      $result =  SimpleSelect("SELECT (p.jml - pd.jml) from (select count(*) as jml from peminjam where tanggalkembali > tanggalbatas) as p                      INNER JOIN (                      (select count(*) as jml from peminjam where tanggalkembali > tanggalbatas)) pd on true");
                      $row = mysqli_fetch_array($result);
                      echo $row[0];
                      mysqli_free_result($result);
                     ?>  
                    </h3>
                    <i class="ti-layers-alt icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                  </div>  
                  
                </div>
              </div>
            </div>
          </div>
       
        </div>
        <?php 
require_once("footer.php");
?>     