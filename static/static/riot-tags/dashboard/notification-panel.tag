<notification-panel>
	<div class="row">
				<!-- begin col-3 -->
				<div class="col-md-6 col-sm-6">
					<div class="widget widget-stats bg-green">
						<div class="stats-icon"><i class="fa fa-desktop"></i></div>
						<div class="stats-info">
							<h4>FUNDRAISER ORDERS</h4>
							<p>{ fundraiserCount }</p>	
						</div>
						<div class="stats-link">
							<a href="#fundraisers">View Fundraisers <i class="fa fa-arrow-circle-o-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<!-- <div class="col-md-3 col-sm-6">
					<div class="widget widget-stats bg-blue">
						<div class="stats-icon"><i class="fa fa-chain-broken"></i></div>
						<div class="stats-info">
							<h4>PRODUCTS</h4>
							<p>{ productCount }</p>	
						</div>
						<div class="stats-link">
							<a href="#products">View Products <i class="fa fa-arrow-circle-o-right"></i></a>
						</div>
					</div>
				</div> -->
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<!-- <div class="col-md-3 col-sm-6">
					<div class="widget widget-stats bg-purple">
						<div class="stats-icon"><i class="fa fa-users"></i></div>
						<div class="stats-info">
							<h4>PLANS</h4>
							<p>{ planCount }</p>	
						</div>
						<div class="stats-link">
							<a href="#plans">View Plans <i class="fa fa-arrow-circle-o-right"></i></a>
						</div>
					</div>
				</div> -->
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-md-6 col-sm-6">
					<div class="widget widget-stats bg-red">
						<div class="stats-icon"><i class="fa fa-clock-o"></i></div>
						<div class="stats-info">
							<h4>ORGANIZATIONS</h4>
							<p>{ profileCount }</p>	
						</div>
						<div class="stats-link">
							<a href="#organizations">View Customers <i class="fa fa-arrow-circle-o-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
			</div>
<script>
	this.on('mount',function(){
		this.opts.store.dashboard.stats().then((stats) => {
			this.productCount = stats.product_count || 0
			this.profileCount = stats.profile_count || 0
			this.fundraiserCount = stats.fundraiser_count || 0
			this.planCount = stats.plan_count || 0
			this.update()
		});
	})
</script>

</notification-panel>