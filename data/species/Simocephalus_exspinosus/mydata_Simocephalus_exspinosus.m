function [data, auxData, metaData, txtData, weights] = mydata_Simocephalus_exspinosus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Simocephalus_exspinosus'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN','TP','TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'}; 
metaData.data_1     = {'t-L'; 't-R'; 'L-Wd'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 11]; 

%% set data
% zero-variate data

data.ab = 2.5;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'SharShar1989';   
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 7.5;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'SharShar1989';   
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 41.16;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'SharShar1989';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0572; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SharShar1989';
data.Lp  = 0.1321; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SharShar1989';
data.Li  = 0.2420;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SharShar1989';
 
data.Wdi = 119.7;   units.Wdi = 'mug';   label.Wdi = 'ultimate dry weight';  bibkey.Wdi = 'guess';
  comment.Wdi = 'based on Simocephalus_serrulatus: (2.44/1.938)^3*60';

% uni-variate data
% time-length-reprod
data.tLR = [ ... % time since birth (h), length (mm), cum offspring (#)
    24.52 0.572   0
    54.52 0.695   0
    89.59 0.883   0
   127.61 1.126   0
   179.61 1.321   6.03
   227.61 1.467  16.73
   275.61 1.648  35.08
   327.61 1.832  57.09
   383.71 1.949  84.09
   441.71 2.069 122.11
   499.71 2.120 153.73
   563.71 2.249 182.33
   631.71 2.276 210.93
   703.71 2.391 238.93
   775.71 2.420 256.93
   847.71 2.420 265.10
   919.71 2.420 265.10
   987.71 2.420 265.10];
data.tLR(:,1) = data.tLR(:,1)/24; % convert h to d
data.tLR(:,2) = data.tLR(:,2)/10; % convert mm to cm
units.tLR   = {'d', 'cm','#'};  label.tLR = {'time since birth', 'length','cumulative offspring'};  
temp.tLR    = C2K(21);  units.temp.tLR = 'K'; label.temp.tLR = 'temperature';
bibkey.tLR = 'SharShar1989'; treat.tLR = {1, {'length','cum reprod'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLR = 5 * weights.tLR; weights.tLR(end-6:end,2) = 0;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'ab data had to be ignored; possibly a delay in the start of development';   
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6YQ3K'; % Cat of Life
metaData.links.id_ITIS = '83900'; % ITIS
metaData.links.id_EoL = '46498282'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Simocephalus_exspinosus'; % ADW
metaData.links.id_Taxo = '156183'; % Taxonomicon
metaData.links.id_WoRMS = '148403'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SharShar1989'; type = 'Article'; bib = [ ... 
'author = {Sharma, Sumita and Sharma, B. K.}, ' ... 
'year = {1989}, ' ...
'title = {Observations on the longevity, instar duration, fecundity, growth and embryonic development in \emph{Simocephalus exspinosus} ({K}och) ({C}ladocera, {D}aphniidae}, ' ...
'journal = {Indian Journal of Animal Sciences }, ' ...
'volume = {59(9)}, ' ...
'pages = {1206-1210}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
