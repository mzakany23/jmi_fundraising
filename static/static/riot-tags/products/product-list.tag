<product-list>
		
		<style type="text/css">
			.hide(){
		    display: none;
		  }

		  img:hover{
		  	border: 1px solid #ddd;
		  }

		</style>	

    <div class="row">

            <!-- begin page-header -->
            <h1 class="page-header">Fundraiser List <small>all active fundraisers</small></h1>

            <page-results page='products' options={ ['10','20'] }></page-results>
            
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
                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="panel-title">List of Jose Madrid Salsa Products</h4>
                                </div>

                                <div class="col-md-6 text-right">
                                    <search-box title='Products' model={ model.results }></search-box>
                                </div>
                            </div>
                            

                        </div>
                        
                        <div class="panel-body">
                            
                         

                            <div class="table-responsive">
                                <table id="data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th>Title</th>
                                            <th>Description</th>
                                            <th>Category</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        
                                <form method='POST' action="">
                                    <tr each={ product,i in model.results } class="odd gradeX { status[product.status] }">
                                        <td>
                                        		<p id="loading{i}">loading...</p>
                                            <img width='195' height='110' value={ i } onload={ turnOffSpinner }  if={ product.image } src="{ product.image }">
                                            <img width='195' height='110' value={ i } onload={ turnOffSpinner }  if={ !product.profile.org_photo } src="http://placehold.it/45x45">
                                        </td>
                                        <td><a onclick={ detail } href="">{ product.title }</a></td>
                                        <td>{ product.description }</td>
                                        <td>{ product.category }</td>
                                        
                                    </tr>
                                </form>
                                        
                                        
                                    </tbody>
                                </table>
                            </div>  

                            <div class="dataTables_info" id="data-table_info" role="status" aria-live="polite">Showing { model.pagination.current_page } to { model.pagination.pages } of { model.pagination.total_records } entries</div>

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
      this.initPage(this.opts.model)
  });


turnOffSpinner(e){
  i = e.item.i
  tag = `#loading${i}`
  $(tag).addClass('hide')
}

// actions
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
        q = riot.route.query()
        if (q.results){
            riot.route(`products/?page=${pageNum}&results=${q.results}`)    
        }else
            riot.route(`products/?page=${pageNum}`)
        
        scroll(0,0)
    }

    setMaxPageCount(num){
        for (var i=1; i<=num;i++){
            this.maxPageCount.push(i)
        }
    }

</script>

</product-list>