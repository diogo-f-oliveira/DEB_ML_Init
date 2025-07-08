function [data, auxData, metaData, txtData, weights] = mydata_Stegastes_acapulcoensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Stegastes_flavilatus'; 
metaData.species_en = 'Beaubrummel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 22];

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(26.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 19*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(26.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 10;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 1.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.02089*Lp^2.98, see F1';
data.Wwi = 97;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.98, see F1';

data.Ri  = 20; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL_B = [ ... % time (d), standard length (cm)
0.891	6.830
0.997	7.878
1.001	6.483
1.004	5.281
1.034	7.646
1.067	9.041
1.147	5.980
1.973	9.903
1.973	9.709
1.975	9.089
2.086	8.082
2.918	9.059
2.990	9.448
3.973	8.256
4.915	9.079
4.950	9.505
5.060	9.235
5.929	9.825
5.966	9.515
6.945	9.912
7.925	9.922
8.904	10.590
9.922	9.631
10.902	10.028
11.992	9.457
13.006	10.204
16.964	9.622
19.032	10.223];
data.tL_B(:,1) = 365 * (0.5 + data.tL_B(:,1)); % convert yr to d
for i=2:size(data.tL_B,1); if data.tL_B(i,1)<=data.tL_B(i-1,1); data.tL_B(i,1)=data.tL_B(i-1,1)+1e-3;end;end
units.tL_B   = {'d', 'cm'};  label.tL_B = {'time since birth', 'standard length', 'Baja'};  
temp.tL_B    = C2K(26.2);  units.temp.tL_B = 'K'; label.temp.tL_B = 'temperature';
bibkey.tL_B = 'MeekAcke2001';
%
data.tL_P = [ ... % time (d), standard length (cm)
0.960	7.619
0.960	8.779
0.982	5.725
0.982	6.962
1.004	5.918
1.004	7.735
1.025	5.493
1.025	6.653
1.025	7.967
1.047	7.271
1.047	8.431
1.069	8.277
1.942	8.279
1.964	7.004
1.985	8.782
1.985	8.473
1.985	7.970
1.985	7.506
1.985	7.236
2.007	9.091
2.029	7.661
2.945	8.360
2.967	9.211
2.989	8.669
2.989	9.481
3.033	8.863
4.015	8.827];
data.tL_P(:,1) = 365 * (0.5 + data.tL_P(:,1)); % convert yr to d
for i=2:size(data.tL_P,1); if data.tL_P(i,1)<=data.tL_P(i-1,1); data.tL_P(i,1)=data.tL_P(i-1,1)+1e-3;end;end
units.tL_P   = {'d', 'cm'};  label.tL_P = {'time since birth', 'standard length', 'Panama'};  
temp.tL_P    = C2K(26.2);  units.temp.tL_P = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_P = 'MeekAcke2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_B = 5 * weights.tL_B;
weights.tL_P = 5 * weights.tL_P;
weights.ab = 0 * weights.ab;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_B','tL_P'}; subtitle1 = {'Data from Baja, Panama'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4ZNMK'; % Cat of Life
metaData.links.id_ITIS = '615329'; % ITIS
metaData.links.id_EoL = '46572322'; % Ency of Life
metaData.links.id_Wiki = 'Stegastes_acapulcoensis'; % Wikipedia
metaData.links.id_ADW = 'Stegastes_acapulcoensis'; % ADW
metaData.links.id_Taxo = '188061'; % Taxonomicon
metaData.links.id_WoRMS = '276658'; % WoRMS
metaData.links.id_fishbase = 'Stegastes-acapulcoensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stegastes_acapulcoensis}}';
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
bibkey = 'MeekAcke2001'; type = 'Article'; bib = [ ... 
'doi = {10.3354/MEPS212223}, ' ...
'author = {M. G. Meekan and J. L. Ackerman and G. M. Wellington}, ' ... 
'year = {2001}, ' ...
'title = {Demography and age structures of coral reef damselfishes in the tropical eastern {P}acific {O}cean}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {212}, ' ...
'pages = {223–232}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Stegastes-acapulcoensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
