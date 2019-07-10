var event1 = inst1.Transfer() ;
event1.watch(function(error,result){
  if (!error)
    console.log("request approval");
    inst1.approve(result.args['from'],result.args['to'], result.args['value'] ,                  {from:eth.accounts[1], gas:1000000});
});

