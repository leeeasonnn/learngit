warning off
FileTif = 'F:\A_Colony expansion\20X_YW447date0809_24h_NB_PDMS_MSM1_003\binerized.tif';
InfoImage = imfinfo(FileTif);
mImage = InfoImage(1).Width;
nImage = InfoImage(1).Height;
NumberImages = length(InfoImage);
FinalImage = zeros(nImage,mImage,NumberImages,'uint8');

TifLink = Tiff(FileTif, 'r');
for i = 1:NumberImages
   TifLink.setDirectory(i);
   FinalImage(:,:,i) = TifLink.read();
end
TifLink.close();
RawImage = im2double(FinalImage);
% get first frame
Number = NumberImages;
Area = zeros(1,Number);
Perimeter = zeros(1,Number);
for i = 1:Number
FirstImage = RawImage(:,:,i);
[L, num] = bwlabel(FirstImage);
props = regionprops(L,'Area','Perimeter');
allAreas = [props.Area];
allPerimeters = [props.Perimeter];
colonyindex = find(allAreas==max(allAreas));
Area(i) = allAreas(colonyindex);
 allAreas(colonyindex);
Perimeter(i) = allPerimeters(colonyindex);
allPerimeters(colonyindex);
end
 
