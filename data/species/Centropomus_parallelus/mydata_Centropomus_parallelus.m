function [data, auxData, metaData, txtData, weights] = mydata_Centropomus_parallelus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centropomiformes'; 
metaData.family     = 'Centropomidae';
metaData.species    = 'Centropomus_parallelus'; 
metaData.species_en = 'Fat snook'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMm', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 02 21]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 21];

%% set data
% zero-variate data

data.ab = 20;   units.ab = 'd';    label.ab = 'time at birth';   bibkey.ab = 'guess';   
  temp.ab = C2K(27.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am =  15* 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'VazdRoss2019';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 36;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 72;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 625; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max. published weight; based on 0.00759*Li^3.06, see F1, gives 3.7 kg';

data.Ri  = 9e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm) 
 0	4.685
 1	10.941
 2	18.111
 3	24.239
 4	29.067
 5	33.764
 6	37.420
 7	41.075
 8	44.862
 9	49.170
12	54.154
13	56.899];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); %set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VazdRoss2019';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50*weights.tL;
weights.ab = 0*weights.ab;
weights.Wwb = 3*weights.Wwb;
weights.Wwp = 0*weights.Wwp;
weights.Wwi = 5*weights.Wwi;
weights.Li = 5*weights.Li;
weights.Ri = 3*weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_fBosque','tL_mBosque'}; subtitle1 = {'data for females, males at Barra el Bosque'};
% set2 = {'tL_fPedro','tL_mPedro'}; subtitle2 = {'data for females, males at Barra San Pedro'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight relationship: Ww in g  = 0.00759*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'SB4P'; % Cat of Life
metaData.links.id_ITIS = '167646'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Centropomus_parallelus'; % Wikipedia
metaData.links.id_ADW = 'Centropomus_parallelus'; % ADW
metaData.links.id_Taxo = '166732'; % Taxonomicon
metaData.links.id_WoRMS = '280064'; % WoRMS
metaData.links.id_fishbase = 'Centropomus-parallelus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centropomus_parallelus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VazdRoss2019'; type = 'techreport'; bib = [ ... 
'author = {Andr\''{e} Martins Vaz-dos-Santos and Carmen L\''{u}cia Del Bianco Rossi-Wongtschowski}, '...
'year = {2019}, ' ...
'title = {Growth in fisheries resources from the {S}outhwestern {A}tlantic}, ' ...
'institution = {Instituto Oceanogr\''{a}fico – USP S\~{a}o Paulo}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/Centropomus-parallelus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
