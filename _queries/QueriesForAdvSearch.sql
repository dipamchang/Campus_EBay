select * from EBay_Item where Item_Name_vc like '%Head%' -- Item
select * from EBay_Item where Category_ID_fk_bi = (select Category_ID_pk_bi from EBay_Category_Mst where Category_Name_vc = 'Books') --category
select * from EBay_Item where Student_ID_fk_bi = (select Student_ID_pk_bi from EBay_Student where Hostel_ID_fk_si = 1) --Hostel
select * from EBay_Item where Student_ID_fk_bi = (select Student_ID_fk_bi from EBay_Personal_Details where Username_vc = 'Nithanaroy') --Username
select * from EBay_Item where Time_ID_fk_bi = (select Time_ID_pk_bi from EBay_Time_Mst where Date_Time_sdt > GETDATE() AND Date_Time_sdt < GETDATE()) --From to To
select * from EBay_Item where Description_t like '%Something he/she entered%' --Description


select top 10 * from EBay_Item order by Item_ID_pk_bi desc --Top 10 rows
select * from EBay_Item where Item_ID_pk_bi = 1 -- objectDetailsForObjectID 
