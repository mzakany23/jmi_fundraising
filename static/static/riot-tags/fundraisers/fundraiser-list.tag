<fundraiser-list>

    <div class="row">

            <!-- begin page-header -->
            <h1 class="page-header">Fundraiser List <small>all active fundraisers</small></h1>

            <page-results page='fundraisers' options={ ['10','20','30','1000'] }></page-results>
            
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
                                    <h4 class="panel-title">List of Jose Madrid Salsa Fundraisers</h4>
                                </div>

                                <div class="col-md-6 text-right">
                                    <search-box title='Fundraisers' model={ model.results }></search-box>
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
                                            <th>Date Created</th>
                                            <th>Organization</th>
                                            <th>Payment</th>
                                            <!-- <th>Type</th>
                                            <th>Discount</th>
                                            <th>Finalized</th> -->
                                            <th>Net Total</th>
                                            <th>Email Confirm</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        
                                <form method='POST' action="">
                                    <tr each={ fundraiser in model.results } class="odd gradeX { status[fundraiser.status] }">
                                        <td>
                                            <img width='45' height='45' src="{ fundraiser.profile.org_photo || 'http://placehold.it/45x45' }">
                                        </td>
                                        <td><a onclick={ detail } href="">{ fundraiser.title }</a></td>
                                        <td>{ moment(fundraiser.created).format('MMMM Do YYYY, h:mm:ss a') }</td>
                                        <td>{ fundraiser.profile.organization }</td>
                                        <td><payment-status fundraiser={ fundraiser }></payment-status></td>
                                        <!-- <td>{ fundraiser.type }</td>
                                        <td>{ fundraiser.discount }</td>
                                        <td>{ fundraiser.finalized }</td> -->
                                        <td>${ fundraiser.order_details.net_total }</td>
                                        <td><email-fundraiser-confirm fundraiser={ fundraiser } store={ store }></email-fundraiser-confirm></td>
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
    self = this;
    this.status = {
        'in-process': 'warning',
        'paid': 'success',
        'unpaid': 'danger'
    }

    this.on('mount',function(){
        this.store = this.opts.store
        this.initPage(this.opts.model)
    });

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

    detail(e){
        fundraiser = e.item.fundraiser
        this.currentFundraiser = fundraiser
        this.opts.bus.trigger('detailView',{fundraiser:fundraiser})
        riot.route(`/fundraisers/${fundraiser.id}`)   
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
            riot.route(`fundraisers/?page=${pageNum}&results=${q.results}`)    
        }else
            riot.route(`fundraisers/?page=${pageNum}`)
        
        scroll(0,0)
    }

    setMaxPageCount(num){
        for (var i=1; i<=num;i++){
            this.maxPageCount.push(i)
        }
    }

</script>


</fundraiser-list>