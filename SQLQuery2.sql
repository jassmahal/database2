/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [UniqueID ]
      ,[ParcelID]
      ,[LandUse]
      ,[PropertyAddress]
      ,[SaleDate]
      ,[SalePrice]
      ,[LegalReference]
      ,[SoldAsVacant]
      ,[OwnerName]
      ,[OwnerAddress]
      ,[Acreage]
      ,[TaxDistrict]
      ,[LandValue]
      ,[BuildingValue]
      ,[TotalValue]
      ,[YearBuilt]
      ,[Bedrooms]
      ,[FullBath]
      ,[HalfBath]
  FROM [Portfolio ].[dbo].[Housing]
  Select SaleDateConverted from housing

  Select SaleDate, convert(Date,SaleDate)from Housing

  Update housing set SaleDate=convert(Date,SaleDate)

  Alter table housing add SaleDateConverted Date;
  
  Update housing set SaleDateConverted=convert(Date,SaleDate);

  select * from Housing
   --select * from Housing where PropertyAddress=null;
   order by ParcelID
   select Propertyaddress from housing;
select
   SUBSTRING(propertyaddress,1,CHARINDEX(',',propertyaddress)-1) as address
   , SUBSTRING(propertyaddress,CHARINDEX(',',propertyaddress)+1,LEN(PropertyAddress)) as address
   
   from Housing;
   Alter table housing add PropertySplitAddress varchar(255);
  
  Update housing set PropertySplitAddress=SUBSTRING(propertyaddress,1,CHARINDEX(',',propertyaddress)-1);
  Alter table housing add PropertySplitCity varchar(255);
  
  Update housing set PropertySplitCity=SUBSTRING(propertyaddress,CHARINDEX(',',propertyaddress)+1,LEN(PropertyAddress));

  Select PARSENAME(Replace(owneraddress,',','.'),3)
  ,PARSENAME(Replace(owneraddress,',','.'),2)
  ,PARSENAME(Replace(owneraddress,',','.'),1)
  from housing where OwnerAddress is not null

   Alter table housing add OwnerSplitAddress varchar(255);
  
  Update housing set OwnerSplitAddress=PARSENAME(Replace(owneraddress,',','.'),3);

    Alter table housing add OwnerSplitCity varchar(255);
  
  Update housing set OwnerSplitCity=PARSENAME(Replace(owneraddress,',','.'),2);

  Alter table housing add OwnerSplitState varchar(255);
  
  Update housing set OwnerSplitState=PARSENAME(Replace(owneraddress,',','.'),1);


  Select * from housing;


  Select distinct(SoldAsVacant) from Housing;

  Select distinct(SoldAsVacant), Count(SoldAsVacant) from Housing
  group by SoldAsVacant
  Order by 2

  Select SoldAsVacant
  , Case When SoldAsVacant='Y' Then 'Yes'
   When SoldAsVacant='N' Then 'No'
  Else SoldAsVacant
  End
from housing

update housing
Set SoldAsVacant=Case When SoldAsVacant='Y' Then 'Yes'
   When SoldAsVacant='N' Then 'No'
  Else SoldAsVacant
  End


