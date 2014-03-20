<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="FeedBack_Contact.aspx.cs" Inherits="Misc_Pages_FeedBack_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .Description
        {
            height: 150px;
            padding: 5px;
            z-index: 2;
            display: none;
        }
        
        .Description span
        {
            margin-top: 10px;
            display: block;
        }
        
        #Ack p
        {
            margin-top: 3px;
            margin-bottom: 15px;
        }
        #developers img:hover
        {
            cursor: pointer;
        }
        .MainLinks
        {
            color: Green;
            display: block;
            text-decoration: none;
            margin-top: 20px;
        }
    </style>
    <script type="text/javascript">
        var mywidth;
        $(function () {
            mywidth = $("#developers img").width();
            $("#developers div:eq(1)").css("width", $("#developers div:eq(1)").css("width"));
            $("#developers img").click(function () {
                var index = $(this).index();
                $(this).animate({ opacity: 1, width: mywidth }, 500)
                $(this).siblings().stop(true, true).animate({ opacity: 0.5, width: mywidth - 20 }, 500)
                $("#developers div:eq(1) p").css("display", "none");
                $("#developers div:eq(1) p:eq(" + (index + 1) + ")").stop(true, true).fadeIn(500);
            });
            $(".Description a").each(function () {
                if ($(this).attr("href").indexOf("10.10.10.123") < 0)
                    $(this).attr("target", "blank");
            });

        });

        function resetDevelopers() {
            $("#developers img").animate({ opacity: 1, width: mywidth }, 500)
            $("#developers div:eq(1) p").css("display", "none");
            $("#developers div:eq(1) p:eq(0)").stop(true, true).fadeIn(500);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <div style="background: #FFF; padding: 20px; margin: 30px; -moz-border-radius: 30px 0 30px 0;
        border-radius: 30px 0 30px 0">
        <a class="MainLinks" href="javascript:void(0)" runat="server" name="Developers" onclick="resetDevelopers()"
            title="About Developers of Campus eBay">Developers :) <%--&rarr; Click to know more
            about them :P --%></a>
        <br />
        <div id="developers" style="display: inline-table; margin: 0 auto;">
            <div style="height: 225px;">
                &nbsp;
                <img src="Nitin.jpg" width="250px" alt="Nitin :)" title="Nitin" />
                <img src="Saki.jpg" width="250px" alt="Saket" title="Saket" />
                <img src="Naren.jpg" width="250px" alt="Naren" title="Naren" />
            </div>
            <div style="border: solid 3px #CCC;">
                <p class="Description" style="text-align: center; display: block">
                    <!--General Description-->
                    Developing Campus eBay, we had awesome time working together, solving issues, desgining
                    stuff. Enjoyed each &amp; every moment!
                    <br />
                    <br />
                    This is our dream come true :)
                </p>
                <p class="Description">
                    <!--Nitin-->
                    Hiii, my Friends call me wid diff names - Nytin, NiTiN, Nitu, Neethu :) <span>This website
                        has taken more than an year to develop and I enjoyed every moment designing & developing
                        it, with my best friends, Naren &amp; Saki (I call him so :P ).</span> <span style="text-align: center;">
                            <b>My Projects @ BITS</b>
                            <br />
                            1) <a href="../Home/Default.aspx">Campus eBay</a> 2) <a href="http://bitsaadivision.bits-goa.ac.in/">
                                BITSAAD Website</a> dev with <a href="http://bitsaadivision.bits-goa.ac.in/techTeam.html">
                                    BITSAAD Team</a> 3) <a href="http://10.10.10.109/About%20BPGC/Photo%20Gallery/">Campus
                                        Photo Gallery</a>
                            <br />
                            4) <a href="http://10.1.1.222/gradeanalysis/Default.aspx">Grade Analysis</a> Software
                            5) Dr. <a href="http://dmkulkarni.com">D.M. Kulkarni sir's website</a> </span>
                </p>
                <p class="Description">
                    <!--Saket-->
                    Saket</p>
                <p class="Description">
                    <!--Narendra-->
                    Naren</p>
                <div style="clear: both">
                </div>
            </div>
        </div>
        <br />
        <a class="MainLinks" runat="server" name="Feedback">Feedback &rarr; Feel free to write
            as much as u want. We value every letter of yours ;) </a>
        <p id="FeedBack_ResultLabel" runat="server" style="text-align: center; color: Maroon;
            margin-bottom: 10px; margin-top: 5px;">
            Do mention your name and email if you have any queries or problems so that we can
            respond!
        </p>
        <textarea rows="10" id="Feedback" style="border: 3px solid #CCC; padding: 5px; width: 98%;
            display: block; font-family: Segoe UI, Verdana, Arial; margin-top: 20px;" runat="server"></textarea>
        <br />
        <asp:Button ID="SubmitFeedback" Text="Submit" Width="70px" Height="30px" runat="server"
            OnClick="SubmitFeedback_Click" />
        <br />
        <a class="MainLinks" runat="server" name="Contact">Contact </a>
        <div style="border: solid 3px #CCC; margin-top: 10px;">
            <p class="Description" style="text-align: center; display: block;">
                U can call any of us anytime :) Or just drop in a mail to <span style="color: Blue">
                    bits.campus.ebay[AT]gmail[DOT]com</span>
                <br />
                <br />
                or Mail to&nbsp;&nbsp; <a href="mailto:Nithanaroy@gmail.com?subject=Feedback :: Campus eBay"
                    title="Opens you email client. Eg: Microsoft Outlook in Windows.">Nitin</a>
                &nbsp;||&nbsp; <a href="mailto:naren596@gmail.com?subject=Feedback :: Campus eBay"
                    title="Opens you email client. Eg: Microsoft Outlook in Windows.">Narendra</a>
                &nbsp;||&nbsp; <a href="mailto:saket9999@gmail.com?subject=Feedback :: Campus eBay"
                    title="Opens you email client. Eg: Microsoft Outlook in Windows.">Saket</a>
                &nbsp;||&nbsp; <a href="mailto:krunalkachadia@gmail.com?subject=Feedback :: Campus eBay"
                    title="Opens you email client. Eg: Microsoft Outlook in Windows.">Krunal</a>
                <br />
                <br />
                Thanks ;)
            </p>
        </div>
        <a class="MainLinks" runat="server" name="Acknowledgements">Acknowledgements </a>
        <div id="Ack" style="border: solid 3px #CCC; text-align: justify; padding: 10px;
            margin-top: 10px;">
            <p>
                Besides all our work, this site wouldn't be possible without our friends, well wishers
                & relatives and everyone who helped us in many ways with their valuable advices
                and constant suggestions.
            </p>
            <p>
                We thank our Computer Project instructor, Ms. Ambili Sunil. She was very co-operative
                and always accepted our requests with a smile. Thank you sooo much ma'am.
            </p>
            <p>
                Also we would like to thank Biju Sir for his guidance and very valuable advices
                he gave us, at important points of time.
            </p>
            <p>Special Thanks to all our friends...</p>
            <!--<p>
                Emaad, you are awesome man. Thank you so much yaar for all the tips and tricks you
                shared with us. Thank you so much for helping us out at difficult times :) Thanks
                a lot! _/\_
            </p>
            <p>
                Don't mind if we missed out anyone, but you are there in our hearts and thank you
                so much for making this website a big success.
            </p>
            <table style="width: 100%;" align="center">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        Special Thanks to our friends...
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <acronym title="2008 batch - Chitti Naidu">Nagaraju</acronym>
                    </td>
                    <td>
                        <acronym title="2008 batch - Raju garu :P">Revanth</acronym>
                    </td>
                    <td>
                        <acronym title="2008 batch - Buddi, of course no longer">Naveen Raghuveer</acronym>
                    </td>
                    <td>
                        <acronym title="2008 batch - Small but powerful :P">Shivangi Singh</acronym>
                    </td>
                </tr>
                <tr>
                    <td>
                        <acronym title="2008 batch - a.k.a Attu :)">Atasi Panda</acronym>
                    </td>
                    <td>
                        <acronym title="2008 batch - GG that explains :P">Gaurab Ghosh</acronym>
                    </td>
                    <td>
                        <acronym title="2008 batch - The Bhai Style">Prachi Shukla</acronym>
                    </td>
                    <td>
                        <acronym title="2008 batch. Pilani. Nitin's friend :)">Kayur</acronym>
                    </td>
                </tr>
                <tr>
                    <td>
                        <acronym title="2008 batch - BasketBall Champion BITS Pilani, Goa">Neha Mohanty</acronym>
                    </td>
                    <td>
                        <acronym title="2009 batch">Shweta</acronym>
                    </td>
                    <td>
                        <acronym title="2010 batch. M.E ">Aditya bhayya</acronym>
                    </td>
                    <td>
                        <acronym title="2010 batch - He is an i5">Harish</acronym>
                    </td>
                </tr>
                <tr>
                    <td>
                        <acronym title="2009 batch">Nishant&nbsp;&nbsp; :)</acronym>
                    </td>
                    <td>
                        <acronym title="Server Admin - Thanx bhayya for ur patience and support">Sajal Bhayya</acronym>
                    </td>
                    <td>
                        <acronym title="Server Admin - Thanx a lot bhayya :)">Rakesh Bhayya</acronym>
                    </td>
                    <td title="Verma :P 2008 Batch">
                        Varma
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        To all our first year and second year friends... You guys rock. Thanks for the support.
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        And so on....
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
            </table>-->
            <p>
                Thanks ;)</p>
            <p>
                Campus eBay Team, 2011
            </p>
        </div>
    </div>
</asp:Content>
