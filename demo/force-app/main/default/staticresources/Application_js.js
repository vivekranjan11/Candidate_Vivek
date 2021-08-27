
function alerts()
{
if((document.getElementById('{!$Component.frm.blk.blks.fname}').value==''))
{
alert('Please return first name...........');
return false;
}
if((document.getElementById('{!$Component.frm.blk.blks.salary}').value==''))
{
alert('Please return salary...........');
return false;
}


}