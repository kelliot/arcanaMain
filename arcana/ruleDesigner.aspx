<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="ruleDesigner.aspx.cs" Inherits="arcana.ruleDesigner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- <telerik:RadButton ID="btnAddZone" runat="server" Text="Add Zone" OnClick="btnAddZone_Click"></telerik:RadButton>
   <telerik:RadTextBox ID="RadTextBox1" runat="server"  Text="x"  ClientEvents-OnValueChanged="changed" ClientIDMode="Static"></telerik:RadTextBox> 
     <telerik:RadTextBox ID="RadTextBox2" runat="server"  Text="y"  ClientEvents-OnValueChanged="changed"  ClientIDMode="Static"></telerik:RadTextBox> 
    <div   id="test"  style="background:green; width:100px" >dgh</div>--%>
    <telerik:RadButton ID="btnSave" runat="server" Text="Save As New" OnClick="btnSave_Click" AutoPostBack="true" ></telerik:RadButton>
    <telerik:RadTextBox ID="txtTitle" runat="server" Text="" EmptyMessage="Add Title"></telerik:RadTextBox>
    <telerik:RadTextBox ID="zoneTracker" runat="server" Text="" ClientIDMode="Static" Visible="true"></telerik:RadTextBox>
    <telerik:RadTextBox ID="textTracker" runat="server" Text="" ClientIDMode="Static" Visible="true"></telerik:RadTextBox>
    <telerik:RadTextBox ID="pictureTracker" runat="server" Text="" ClientIDMode="Static" Visible="true"></telerik:RadTextBox>
    
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    
    <style>
        #divContainer, #divResize { 
            border:none; 
            width:10px; 
            height:10px; 
            padding:5px; 
            margin:5px; 
            font:13px Arial; 
            cursor:move; 
            float:left 
        } 
    </style>

    <div>
        <div id="divContainer" > 
          move all
        </div>

        <input type="button"  style="float:left" id="btnNewZone" value="New Zone" />

        
    </div>






    <script>
        //var element_pos = 0;    
        
        var iCnt = 0;
        var txtCnt = 0;
        //var picCnt = 0;

        $(document).ready(function () {

            $(function () { $('#divContainer').draggable(); });
            

            
            $('#btnNewZone').click(function () {

                var createdDiv = $(document.createElement('div')).css({
                    border: '1px dashed', position: 'absolute', left: 0,
                    top: $('#divContainer').height() + 20,
                    width: '120', height: '120', padding: '3', margin: '0'
                });

                var labelx = $(document.createElement('label')).css({
                    border: '1px dashed', position: 'absolute', left: 0,
                    top: $('#divContainer').height() + 20,
                    width: '50', height: '50', padding: '3', margin: '0', visibility: 'hidden'
                });
                var labely = $(document.createElement('label')).css({
                    border: '1px dashed', position: 'absolute', left: 0,
                    top: $('#divContainer').height() + 70,
                    width: '50', height: '50', padding: '3', margin: '0', visibility: 'hidden'
                });
                var btnAddText = $(document.createElement('button')).css({
                    border: '1px dashed', position: 'relitive', left: 0,
                    top: $('#divContainer').height() + 70,
                    width: '50', height: '50', padding: '3', margin: '0'
                });
                //var btnAddPicture = $(document.createElement('button')).css({
                //    border: '1px dashed', position: 'relitive', left: 0,
                //    top: $('#divContainer').height() + 70, 
                //    width: '50', height: '50', padding: '3', margin: '0'
                //});
                $(btnAddText).click(
                    function (num, zone) {
                        return function (e) {
                            //alert("tets" + num);
                            ;
                            var textBox = $(document.createElement('textarea')).css({
                                border: '1px dashed', position: 'relitive', left: 0,
                                top: $('#divContainer').height() + 70,
                                width: '50', height: '50', padding: '3', margin: '0'
                            });
                            $(zone).append(textBox);
                            textBox.change(function (n, cnt, bx) { return function () { document.getElementById('textTracker').value = document.getElementById('textTracker').value + n + "," + cnt + "," + bx.height() + "," + bx.width() + "," + $(bx).val() + ";"; } }(num, txtCnt, textBox));
                            txtCnt++
                            e.preventDefault();

                        }
                    }(iCnt, createdDiv));

                //$(btnAddPicture).click(
                //    function (numP, zoneP) {
                //        return function (e) {
                //            var lookFor = $(document.createElement('input')).css({
                //                border: '1px dashed', position: 'relitive', left: 0,
                //                top: $('#divContainer').height() + 70, type: 'file', 
                //                width: '50', height: '50', padding: '3', margin: '0'
                //            });
                //            lookFor.attr("type", "file");
                //            lookFor.attr("id", "pic" + picCnt);
                //            lookFor.attr("name", "pic"+picCnt);
                //            var pictureBoxLBL = $(document.createElement('label')).css({
                //                position: 'relitive', left: 0,
                //                top: $('#divContainer').height() + 70,
                //                width: '50', height: '50', padding: '3', margin: '0'
                //            });
                //            var pictureBox = $(document.createElement('img')).css({
                //                 position: 'relitive', left: 0, 
                //                 top: $('#divContainer').height() + 70,
                //                width: '50', height: '50', padding: '3', margin: '0'
                //            });
                //            pictureBox.attr("for", "pic" + picCnt);
                //            $(zoneP).append(pictureBoxLBL);
                //            pictureBox.attr("src", "");
                //            pictureBoxLBL.append(pictureBox)
                //            $(zoneP).append(lookFor);
                //            picCnt++;
                //            e.preventDefault();
                //        }
                //    }(iCnt, createdDiv)
                //);



            document.getElementById('zoneTracker').value = document.getElementById('zoneTracker').value + (iCnt) + "," + 0 + "," + 10 + ";";   
            $(createdDiv).append(btnAddText.append('Add Text'));
           // $(createdDiv).append(btnAddPicture.append('Add Picture'));
            
                $(createdDiv).appendTo('#divContainer').draggable({

                    
                    drag: function () {
                        //var offset = $(createdDiv).offset();
                        ////alert(offset.left);
                        //$(labelx).text(offset.left);
                        //$(labely).text(offset.top);
                        //document.getElementById('zoneTracker').value = document.getElementById('zoneTracker').value + iCnt + "," + offset.left + "," + offset.top + ";";
                    },
                    stop: function (x, y, icntt, divnew) {
                        return function () {
                            var offset = $(divnew).offset();
                            //alert(document.getElementById('RadTextBox1').value);
                            $(x).value = offset.left;
                            $(y).value = offset.top;
                            document.getElementById('zoneTracker').value = document.getElementById('zoneTracker').value + icntt + "," + offset.left + "," + offset.top + ";";
                        }
                    }(labelx, labely, iCnt, createdDiv),
                   
                });
               var x = $(labelx).appendTo('#divContainer').draggable();
               var y = $(labely).appendTo('#divContainer').draggable();
               //document.getElementById('zoneTracker').value = document.getElementById('zoneTracker').value + 5 + "," + $(labely).attr('id')  + ";";
                iCnt = iCnt + 1;
            });
        });
        $(document).ready(
            function () {
                if (document.getElementById('zoneTracker').value != "") {
                    //alert("dvdcvsav");
                    var i = 0;
                    var createdDiv;
                    var labelx;
                    var labely;
                    var btnAddText;
                    for (i = 0; document.getElementById('zoneTracker').value.split(';').length - 1 > i; i++)
                    {
                        

                            createdDiv = $(document.createElement('div')).css({
                                border: '1px dashed', position: 'absolute', left: parseInt( document.getElementById('zoneTracker').value.split(';')[i].split(',')[1]),
                                top: parseInt(document.getElementById('zoneTracker').value.split(';')[i].split(',')[2]),
                                width: '120', height: '120', padding: '3', margin: '0'
                            });

                            labelx = $(document.createElement('label')).css({
                                border: '1px dashed', position: 'absolute', left: 0,
                                top: $('#divContainer').height() + 20,
                                width: '50', height: '50', padding: '3', margin: '0', visibility: 'hidden'
                            });
                            labely = $(document.createElement('label')).css({
                                border: '1px dashed', position: 'absolute', left: 0,
                                top: $('#divContainer').height() + 70,
                                width: '50', height: '50', padding: '3', margin: '0', visibility: 'hidden'
                            });
                           btnAddText = $(document.createElement('button')).css({
                                border: '1px dashed', position: 'relitive', left: 0,
                                top: $('#divContainer').height() + 70,
                                width: '50', height: '50', padding: '3', margin: '0'
                            });

                            $(btnAddText).click(
                                function (num, zone) {
                                    return function (e) {
                                        //alert("tets" + num);
                                        
                                        var textBox = $(document.createElement('textarea')).css({
                                            border: '1px dashed', position: 'relitive', left: 0,
                                            top: $('#divContainer').height() + 70,
                                            width: '50', height: '50', padding: '3', margin: '0'
                                        });
                                        $(zone).append(textBox);
                                        textBox.change(function (n, cnt, bx) { return function () { document.getElementById('textTracker').value = document.getElementById('textTracker').value + n + "," + cnt + "," + bx.height() + "," + bx.width() + "," + $(bx).val() + ";"; } }(num, txtCnt, textBox));
                                        txtCnt++;
                                        e.preventDefault();
                                        
                                    }
                                }(iCnt, createdDiv));
                            //document.getElementById('zoneTracker').value = document.getElementById('zoneTracker').value + (iCnt + 1) + "," + 0 + "," + 10 + ";";
                            $(createdDiv).append(btnAddText.append('Add Text'));


                            $(createdDiv).appendTo('#divContainer').draggable({


                                drag: function () {
                                    //var offset = $(createdDiv).offset();
                                    ////alert(offset.left);
                                    //$(labelx).text(offset.left);
                                    //$(labely).text(offset.top);
                                    //document.getElementById('zoneTracker').value = document.getElementById('zoneTracker').value + iCnt + "," + offset.left + "," + offset.top + ";";
                                },
                                stop: function (x, y, icntt, divnew) {
                                    return function () {
                                        var offset = $(divnew).offset();
                                        //alert(document.getElementById('RadTextBox1').value);
                                        $(x).value = offset.left;
                                        $(y).value = offset.top;
                                        document.getElementById('zoneTracker').value = document.getElementById('zoneTracker').value + icntt + "," + offset.left + "," + offset.top + ";";
                                    }
                                }(labelx, labely, iCnt, createdDiv),

                            });
                            $(labelx).appendTo('#divContainer').draggable();
                           $(labely).appendTo('#divContainer').draggable();
                            //document.getElementById('zoneTracker').value = document.getElementById('zoneTracker').value + 5 + "," + $(labely).attr('id')  + ";";
                           
                            var j = 0;
                            for (j = 0; j < document.getElementById('textTracker').value.split(';').length - 1; j++)
                            {
                                if (parseInt(document.getElementById('textTracker').value.split(';')[j].split(',')[0])  == parseInt(document.getElementById('zoneTracker').value.split(';')[i].split(',')[0]))
                                {
                                   
                                    var textBox = $(document.createElement('textarea')).css({
                                        border: '1px dashed', position: 'relitive', left: 0,
                                        top: $('#divContainer').height() + 70,
                                        width: document.getElementById('textTracker').value.split(';')[j].split(',')[3], height: document.getElementById('textTracker').value.split(';')[j].split(',')[2], padding: '3', margin: '0'
                                    });
                                    $(textBox).text(document.getElementById('textTracker').value.split(';')[j].split(',')[4]);
                                    $(createdDiv).append(textBox);
                                    textBox.change(function (n, cnt, bx) { return function () { document.getElementById('textTracker').value = document.getElementById('textTracker').value + n + "," + cnt + "," + bx.height() + "," + bx.width() + "," + $(bx).val() + ";"; } }(iCnt, txtCnt, textBox));
                                     txtCnt++;
                                }
                            }
                        iCnt = iCnt + 1;

                    }
                }
            }

        );
</script>












   <%-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
 <%-- <script>
        
        function changed() {
            //alert(document.getElementById('RadTextBox1').value);
           // $("#mainDiv").css({ position: 'relative' });
            $("#test").css({ left: document.getElementById('RadTextBox1').value + "px", top: document.getElementById('RadTextBox2').value + "px", position: 'absolute'});
           
        }
                $(function (sender, args)
                {
                    alert(sender);
                    $("#test").draggable(
                    {

                        containment: $('test'),
                        drag: function () {
                            var offset = $('#test').offset();
                            //alert(document.getElementById('RadTextBox1').value);
                            document.getElementById('RadTextBox1').value =  offset.left;
                            document.getElementById('RadTextBox2').value =  offset.top;
                        },
                        stop: function () {
                            var offset = $("#test").offset();
                            //alert(document.getElementById('RadTextBox1').value);
                            document.getElementById('RadTextBox1').value= offset.left;
                            document.getElementById('RadTextBox2').value=offset.top;
                        },
                        //revert: 'invalid'
                    })
                })
            ;
        
        </script>--%>
        
   
</asp:Content>
