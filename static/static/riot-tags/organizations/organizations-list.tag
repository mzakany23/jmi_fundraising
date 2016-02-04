<organizations-list>
	 <div class="row">

            <!-- begin page-header -->
            <h1 class="page-header">Organizations List <small>Organization and their Fundraisers</small></h1>
            <!-- end page-header -->
            
            <!-- begin row -->
            <div class="row">
                
                <!-- begin col-10 -->
                <div class="col-md-12">
                    <!-- begin panel -->
                    <div class="panel panel-inverse">
                        <div class="panel-heading">
                            <div class="panel-heading-btn">
                               
                            </div>
                            <h4 class="panel-title">List of Organizations</h4>
                        </div>
                        
                        <div class="panel-body">

                            <div class="table-responsive">
                                <table id="data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                        		<th>Photo</th>
                                            <th>Organization</th>
                                            <th>Contact</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                            <th>Address</th>
                                            <th>Account</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        
                                <form method='POST' action="">
                                    <tr each={ profile in opts.profiles.results } class="odd gradeX">
                                        <td><img src="{ profile.org_photo }"></td>		
                                        <td>{ profile.organization }</td>		
                                        <td>{ profile.first_name } { profile.last_name }</td>		
                                        <td>{ profile.phone_number }</td>		
                                        <td>{ profile.email }</td>		
                                        <td>{ profile.address.street }</td>		
                                        <td>{ profile.account }</td>		
                                    </tr>
                                </form>
                                        
                                        
                                    </tbody>
                                </table>
                            </div>  

                            <div class="dataTables_info" id="data-table_info" role="status" aria-live="polite">Showing { opts.profiles.pagination.current_page } to { opts.profiles.pagination.pages } of { model.pagination.total_records } entries</div>

                            <div class="dataTables_paginate paging_simple_numbers" id="data-table_paginate">
                                
                                <a onclick={ prev } class="paginate_button previous" aria-controls="data-table" data-dt-idx="0" tabindex="0" id="data-table_previous">Previous</a>

                            <span>
                                <a onclick={ getPageNum } each={ num in maxPageCount } class="paginate_button { current: num === currentPage }" aria-controls="data-table" data-dt-idx="1" tabindex="0">{ num }</a>
                            </span>
                                
                                <a onclick={ next } class="paginate_button next" aria-controls="data-table" data-dt-idx="7" tabindex="0" id="data-table_next">Next</a>
                            </div>

                        </div>



                    </div>
                    <!-- end panel -->

                </div>
                <!-- end col-10 -->

            </div>

            <!-- end row -->
        </div>
<script>
	this.on('mount',function(){
		this.initPage(opts.profiles)
	})

	initPage(model){
    this.detailView = false
    this.model = null
    this.current_page = null
    this.cache = this.opts.store.initModel(model).results
    this.maxPageCount = []
    this.model = model
    this.currentPage = parseInt(model.pagination.current_page)
    this.setMaxPageCount(model.pagination.max_pages)
    this.update()
  }
	// pagination buttons
  hasNextPage(){
      return this.model.pagination.has_next === 'True'
  }

  next(){
      nextPage = this.currentPage+1
      if (this.hasNextPage()) this.linkTo(nextPage);
  }

  prev(){
      prevPage = this.currentPage - 1
      if (prevPage >= 1) this.linkTo(prevPage)
  }

  getPageNum(e){
      pageNum = e.item.num
      this.linkTo(pageNum)
  }

  linkTo(pageNum){
      riot.route(`organizations/?page=${pageNum}`)
      scroll(0,0)
  }

  setMaxPageCount(num){
      for (var i=1; i<=num;i++){
          this.maxPageCount.push(i)
      }
  }


</script>

</organizations-list>