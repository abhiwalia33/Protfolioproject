SELECT *
from ProtfolioProject..NashvilleHousing

SELECT SaleDate,CONVERT(date,Saledate)
from ProtfolioProject..NashvilleHousing

UPDATE NashvilleHousing
SET SaleDate =CONVERT(date,Saledate)

ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

Update NashvilleHousing
SET SaleDateConverted = CONVERT(Date,SaleDate)

SELECT *
from ProtfolioProject..NashvilleHousing
--where PropertyAddress is null
ORDER BY ParcelID

SELECT a.PropertyAddress,a.ParcelID,b.PropertyAddress,b.ParcelID,ISNULL(a.PropertyAddress,b.PropertyAddress)
from ProtfolioProject..NashvilleHousing a
JOIN ProtfolioProject..NashvilleHousing b
on a.ParcelID = b.ParcelID
AND a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

UPDATE a
SET PropertyAddress =ISNULL(a.PropertyAddress,b.PropertyAddress)
from ProtfolioProject..NashvilleHousing a
JOIN ProtfolioProject..NashvilleHousing b
on a.ParcelID = b.ParcelID
AND a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

SELECT 
SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) as Address
,SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress) +1,LEN(PropertyAddress)) as Address
FROM ProtfolioProject..NashvilleHousing

ALTER TABLE NashvilleHousing
ADD PropertysplitAddress Nvarchar(255);

Update NashvilleHousing
SET PropertysplitAddress=SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1)

ALTER TABLE NashvilleHousing
Add PropertySplitCity Nvarchar(255);

Update NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))


Select *
From ProtfolioProject..NashvilleHousing

Select OwnerAddress
From ProtfolioProject..NashvilleHousing

SELECT 
PARSENAME(REPLACE(OwnerAddress,',','.'),3)
,PARSENAME(REPLACE(OwnerAddress,',','.'),2)
,PARSENAME(REPLACE(OwnerAddress,',','.'),1)
From ProtfolioProject..NashvilleHousing

ALTER TABLE NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)

ALTER TABLE NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)

ALTER TABLE NashvilleHousing
Add OwnerSplitState Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)

Select *
From ProtfolioProject..NashvilleHousing

-- Change Y and N to Yes and No in "Sold as Vacant" field

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From ProtfolioProject..NashvilleHousing
Group by SoldAsVacant
ORDER by 2

SELECT SoldAsVacant
,CASE when SoldAsVacant ='Y' THEN 'Yes'
      when SoldAsVacant ='N' THEN 'No'
	  ELSE SoldAsVacant
	  END
 
From ProtfolioProject..NashvilleHousing

Update NashvilleHousing
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END

	   Alter Table ProtfolioProject..NashvilleHousing
	   Drop Column OwnerAddress, TaxDistrict, PropertyAddress, SaleDate

	   SELECT *
	   From ProtfolioProject..NashvilleHousing
	   