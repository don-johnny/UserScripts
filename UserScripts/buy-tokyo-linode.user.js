// ==UserScript==
// @name           Buy Tokyo Linode
// @namespace      Buy Tokyo Linode
// @description    Buy Tokyo Linode
// @match          https://manager.linode.com/linodes/add*
// @version        0.4.0
// @grant          none
// @copyright      don-johnny
// @updateURL      https://don-johnny.github.io/UserScripts/UserScripts/buy-tokyo-linode.user.js
// @downloadURL    https://don-johnny.github.io/UserScripts/UserScripts/buy-tokyo-linode.user.js
// ==/UserScript==
// thanks to https://github.com/ytzong/UserScripts
function isContain(ojbCollection, objValue) {
  var isValInCol = false;
  for (var item in ojbCollection) {
    if (item.value == objValue) {
      isValInCol = true;
      break;
    }
  }
  return isValInCol;
}
function refreshJ()
{
  window.location.reload();
}
function doNothing(){}
function buyTokyoNode() {
  try {
    //1G Linode Plan
    var buyPlan = 'linode1024.4';
    var doc_buyPlan = document.getElementById(buyPlan);
    doc_buyPlan.checked = true;
    setTimeout(doNothing, 2000);
    //Tokyo datacenter ID
    var doc_dcID = document.getElementById('DatacenterID');
    var tokyodcID = 8;
    var isTokyoNodeOnsale = isContain(doc_dcID.options, tokyodcID);
    //alert(itemIndex);
    if (isTokyoNodeOnsale)
    {
      //on sale.
      doc_dcID.value = tokyodcID;
      document.getElementById('signup').submit();
    } 
    else
    {
      //out of stock.
      //alert('none');
      //10s refresh cycle
      setTimeout(refreshJ, 5000);
    }
  } 
  catch (e) {
  }
}
//auto reload page to seek tokyo nodes.
buyTokyoNode();
