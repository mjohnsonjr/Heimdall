<div class="well well-sm">
	<h3>Message Center</h3>
</div>

<ul class="nav nav-tabs">
  <li class="active"><a href="#inbox" data-toggle="tab">Inbox</a></li>
  <li><a href="#sendGlobal" data-toggle="tab">Send Global</a></li>
  <li><a href="#sendPrivate" data-toggle="tab">Send Private</a></li>
</ul>


<!-- Tab panes -->
<div class="tab-content">
<!-- Tab pane0 -->
	<!-- Pane0 Effect -->
	<div class="tab-pane fade in active" id="inbox">
		<!-- Pane0 Type -->
		<div class="panel panel-default">
			<!-- Panel Contents -->
			<div class="panel-heading">Inbox</div>
				<div class="list-group">
  					<a href="#" class="list-group-item">
    					<h4 class="list-group-item-heading">(Variable)Date1, Company1, Title1, Name1</h4>
   					 	<p class="list-group-item-text">(Variable)Message1</p>
 					</a>
				</div>	
				<div class="list-group">
  					<a href="#" class="list-group-item">
    					<h4 class="list-group-item-heading">(Variable)Date2, Company2, Title2, Name2</h4>
   					 	<p class="list-group-item-text">(Variable)Message2</p>
 					</a>
				</div>		
		</div>
	</div>
	
<!-- Tab pane1 -->
	<!-- Panel Effect -->
	<div class="tab-pane fade" id="sendGlobal">
		<!-- Panel Type -->
		<div class="panel panel-default">
			<!-- Panel Contents -->
			<div class="panel-heading">Message to all users</div>
				<div class="input-group">
  					<input type="text" class="form-control" placeholder="Global Message">
				</div> 
				<button class="btn btn-default" type="button">Send</button>	
		</div>
	</div>
	
<!-- Tab pane2 -->
  	<!-- Panel Effect -->
	<div class="tab-pane fade" id="sendPrivate">
		<!-- Panel Type -->
		<div class="panel panel-default">
			<!-- Panel Contents -->
			<div class="panel-heading">Message to individuals</div>
				
  					<div class="input-group">
  						<input type="text" class="form-control" placeholder="Private Message">
					</div> 
					
					<div class="btn-group">
  					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
    					Company <span class="caret"></span>
  					</button>
  					<ul class="dropdown-menu" role="menu">
    					<li><a href="#">Company1</a></li>
    					<li><a href="#">Company2</a></li>
   						<li><a href="#">Company3</a></li>
  						<li class="divider"></li>
   						<li><a href="#">All Companies</a></li>
  					</ul>
  					</div>
  					<div class="btn-group">
  					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
    					Title <span class="caret"></span>
 	 				</button>
  					<ul class="dropdown-menu" role="menu">
    					<li><a href="#">Manager</a></li>
    					<li><a href="#">Employee</a></li>
    					<li class="divider"></li>
    					<li><a href="#">All Titles</a></li>
  					</ul>
  					</div>
  					<div class="btn-group">
  					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
    					Name <span class="caret"></span>
 	 				</button>
  					<ul class="dropdown-menu" role="menu">
    					<li><a href="#">Name1</a></li>
    					<li><a href="#">Name2</a></li>
    					<li><a href="#">Name3</a></li>
    					<li class="divider"></li>
    					<li><a href="#">All Employees</a></li>
  					</ul>
  					<button class="btn btn-default" type="button">Send</button>
				</div>
				
		</div>
	</div>
</div>

