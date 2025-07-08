function [data, auxData, metaData, txtData, weights] = mydata_Odax_pullus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Odacidae';
metaData.species    = 'Odax_pullus'; 
metaData.species_en = 'Butterfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 04];

%% set data
% zero-variate data

data.am = 11*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 24.6;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 40;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';

data.Wwb = 9e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';               bibkey.Wwb = 'TripClem2011';
  comment.Wwb = 'based on egg diameter of 1.2 mm : pi/6*0.12^3';
data.Wwp = 133;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';              bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00692*Lp^3.0, see F1';
data.Wwi = 595;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00692*Li^3.08, see F1; max published weight 1.5 kg';
  
data.Ri  = 389000/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time - length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1  7.4
    2 15.0
    3 23.0
    4 30.3
    5 36.1
    6 40.0
    7 42.8
    8 44.9];
data.tL(:,1) = (0+data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PaulMaol2000';

% time - length
data.tL1 = [ ... % time since birth (yr), fork length (cm)
0.320	9.326
0.366	10.724
0.383	10.990
0.406	13.386
0.406	10.125
0.423	11.589
0.429	13.719
0.434	20.973
0.451	12.454
0.474	13.652
0.486	19.443
0.497	12.854
0.514	13.120
0.526	12.587
0.560	15.516
0.560	15.715
0.571	17.512
0.577	19.110
0.589	17.313
0.594	16.181
0.606	13.253
0.611	13.586
0.617	16.980
0.617	14.052
0.629	13.785
0.634	22.304
0.651	15.782
0.680	14.384
0.703	16.847
0.743	16.248
0.840	15.915
0.903	17.712
0.983	16.448
0.989	26.032
0.989	24.434
0.989	14.784
0.994	24.700
0.994	23.636
0.994	20.374
0.994	20.042
0.994	19.842
0.994	18.710
0.994	18.111
0.994	17.779
1.000	23.968
1.000	23.037
1.000	20.973
1.000	17.180
1.000	15.316
1.006	28.627
1.006	27.829
1.006	25.566
1.006	22.438
1.011	19.243
1.983	32.022
1.983	31.356
1.983	28.228
1.989	30.757
1.989	28.960
1.989	27.230
1.994	33.087
1.994	27.762
2.006	30.424
2.006	29.293
2.989	38.877
2.989	34.151
2.994	39.542
2.994	35.948
3.000	42.804
3.000	36.814
3.000	35.616
3.006	37.413
3.006	35.083
3.011	38.544
3.011	30.092
3.023	41.672
3.989	39.676
4.006	41.739];
data.tL1(:,1) = (0.2+data.tL1(:,1)) * 365; % convert yr to d
for i=2:size(data.tL1,1); if data.tL1(i,1)<=data.tL1(i-1,1);data.tL1(i,1)=data.tL1(i-1,1)+1e-8;end;end
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'fork length'};  
temp.tL1    = C2K(17);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'TripClem2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tL1 = 3 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00692*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '48MXR'; % Cat of Life
metaData.links.id_ITIS = '170799'; % ITIS630331
metaData.links.id_EoL = '46572874'; % Ency of Life
metaData.links.id_Wiki = 'Odax_pullus'; % Wikipedia
metaData.links.id_ADW = 'Odax_pullus'; % ADW
metaData.links.id_Taxo = '181620'; % Taxonomicon
metaData.links.id_WoRMS = '281815'; % WoRMS
metaData.links.id_fishbase = 'Odax-pullus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Odax_pullus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...180421
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaulMaol2000'; type = 'techreport'; bib = [ ... 
'author = {Paul, L.J. and C.\''{O}. Maolag\''{a}in and M.P. Francis and A. Dunn and R.I.C.C. Francis}, ' ... 
'year = {2000}, ' ...
'title = {Age, growth, mortality, and yield per recruit of butterfish (\emph{Odax pullus}) in {C}ook {S}trait, {N}ew {Z}ealand}, ' ...
'institution = {New Zealand Fisheries Assessment}, ' ...
'volume = {30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TripClem2011'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2010.02889.x}, ' ...
'author = {Trip, E. D. L. and Clements, K. D. and Raubenheimer, D. and Choat, J. H.}, ' ... 
'year = {2011}, ' ...
'title = {Reproductive biology of an odacine labrid, \emph{Odax pullus}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {78(3)}, ' ...
'pages = {741–761}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Odax-pullus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

