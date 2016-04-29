clear all
%% params

k1=-0;
k2=0;

matchExp=0;
blend='Alpha';
which=3;
path='imgs';

%%
%                    bad 
datasets={'ucsb4','family_house','glacier4','yellowstone2','GrandCanyon1',...
    'yellowstone5'};

focus=[595,400,2000,1000,1000,1000];
Full360=[0,1,0,0,0,0];
loop=Full360(which);
f=focus(which);
run('lib/vlfeat-0.9.20/toolbox/vl_setup');

s=imageSet(fullfile(path,datasets{which}));
img=read(s,1);
imgs=zeros(size(img,1),size(img,2),size(img,3),s.Count,'like',img);
for i=1:s.Count
    imgs(:,:,:,i)=read(s,i);
end

panorama=createPanoramaCyl( imgs, f, k1, k2, loop, matchExp, blend );
imwrite(panorama,[datasets{which},'.jpg']);