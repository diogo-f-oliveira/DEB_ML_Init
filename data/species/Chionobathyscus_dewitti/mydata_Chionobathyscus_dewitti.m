  function [data, auxData, metaData, txtData, weights] = mydata_Chionobathyscus_dewitti
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Channichthyidae';
metaData.species    = 'Chionobathyscus_dewitti'; 
metaData.species_en = 'Icefish'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 03];

%% set data
% zero-variate data
data.ab = 35;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(0.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 12*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'SuttMann2008';   
  temp.am = C2K(0.4); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 32;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'guess'; 
  comment.Lp = 'based on Chaenodraco_wilsoni: 23*60/43 cm';
data.Li = 60;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0616;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MesaDona2023';
  comment.Wwb = 'based on egg diameter of 4.9 mm: pi/6*0.49^3';
data.Wwp = 212.7;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00123*Lp^3.48, see F1';
data.Wwi = 1.9e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00123*Li^3.48, see F1';

data.Ri = 15612/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(0.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_f = [ ... % time(yr), total length (cm)
1.449	28.141
2.500	32.575
2.500	31.639
2.500	31.213
2.536	30.873
2.536	29.597
2.572	34.959
2.572	30.193
2.609	30.023
3.478	30.286
3.514	32.924
3.514	34.541
3.551	31.307
3.551	31.818
3.551	33.095
3.551	33.861
3.551	37.265
3.587	36.329
3.623	32.414
3.623	36.074
4.457	39.400
4.457	37.102
4.457	30.719
4.493	37.528
4.493	36.677
4.493	35.571
4.493	33.443
4.493	32.762
4.493	32.422
4.493	32.081
4.529	40.252
4.529	38.039
4.529	37.869
4.529	34.975
4.529	33.103
4.529	32.933
4.529	29.699
4.565	41.359
4.601	36.253
5.435	44.004
5.471	33.877
5.471	34.558
5.471	35.579
5.471	37.451
5.471	37.962
5.471	37.962
5.471	38.473
5.471	38.898
5.471	39.494
5.507	32.345
5.507	43.154
5.507	44.601
5.543	42.644
5.543	46.048
5.580	36.686
5.616	39.836
5.652	40.687
5.652	40.772
5.652	41.198
6.449	39.928
6.449	38.396
6.486	45.971
6.486	42.566
6.486	37.205
6.522	41.716
6.522	39.248
6.522	39.163
6.522	37.631
6.558	45.120
6.558	41.035
6.558	38.907
6.558	37.971
7.464	39.511
7.500	39.086
7.500	41.894
7.500	42.405
7.500	42.575
7.500	43.256
7.536	40.533
7.536	41.384
7.536	47.256
7.609	44.023
7.609	44.278
7.609	44.874
7.609	45.214
8.514	47.690
8.514	41.648
8.514	39.945
8.551	44.627
8.551	44.456
8.587	46.074
10.580	44.644
11.522	42.524];
data.tL_f(:,1) = 365 * (0.3+data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-4;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time', 'total length','females'};  
temp.tL_f = C2K(0.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SuttMann2008'; 
%
data.tL_m = [ ... % time(yr), total length (cm)
1.341	26.930
1.449	28.379
2.428	27.128
2.428	28.915
2.428	29.596
2.428	30.617
2.428	30.872
2.428	31.894
2.428	33.000
2.464	28.405
2.464	30.022
2.464	31.043
2.464	32.405
2.500	31.555
2.500	31.555
3.297	30.724
3.370	36.599
3.406	35.748
3.406	30.046
3.442	34.643
3.442	31.834
3.478	33.963
3.478	29.197
3.514	33.198
3.514	32.687
3.514	32.262
3.514	31.155
3.551	33.710
4.348	30.155
4.384	37.646
4.420	32.881
4.457	33.733
4.457	34.414
4.457	34.839
4.457	35.945
4.457	36.456
4.457	38.584
4.493	35.095
4.493	36.202
4.493	36.883
4.529	35.522
5.399	35.969
5.399	35.629
5.435	39.034
5.435	38.268
5.435	37.587
5.435	36.907
5.471	34.610
5.471	32.227
5.543	36.569
6.341	37.866
6.413	34.549
6.449	35.401
6.449	36.337
7.428	38.574
7.464	37.724
7.500	36.619
7.572	40.025
8.442	40.302
8.551	38.858];
data.tL_m(:,1) = 365 * (0.3+data.tL_m(:,1));  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-4;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time', 'total length','males'};  
temp.tL_m = C2K(0.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SuttMann2008'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  3 * weights.tL_f;
weights.tL_m =  3 * weights.tL_m;
weights.Wwb =  5 * weights.Wwb;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00123*(TL in cm)^3.48';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5Y5F3'; % Cat of Life
metaData.links.id_ITIS = '642770'; % ITIS
metaData.links.id_EoL = '46573068'; % Ency of Life
metaData.links.id_Wiki = 'Chionobathyscus_dewitti'; % Wikipedia
metaData.links.id_ADW = 'Chionobathyscus_dewitti'; % ADW
metaData.links.id_Taxo = '170836'; % Taxonomicon
metaData.links.id_WoRMS = '234650'; % WoRMS
metaData.links.id_fishbase = 'Chionobathyscus-dewitti'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chionobathyscus_dewitti}}';  
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
bibkey = 'SuttMann2008'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-008-0471-7}, ' ...
'author = {C.P. Sutton and M.J. Manning and D.W. Stevens and P.M. Marriott}, ' ...
'year = {2008}, ' ...
'title = {BIOLOGICAL PARAMETERS FOR ICEFISH (\emph{Chionobathyscus dewitti}) IN THE {R}OSS {S}EA, {A}NTARCTICA}, ' ... 
'journal = {CCAMLR Science}, ' ...
'volume = {15}, ' ...
'pages = {139–165}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MesaDona2023'; type = 'Article'; bib = [ ... 
'author = {Mario La Mesa and Fortunata Donato and Emilio Riginella}, ' ...
'year = {2023}, ' ...
'title = {Life history and population structure of the {A}ntarctic icefish, \emph{Pagetopsis maculata} ({N}otothenioidei, {C}hannichthyidae) from the {W}eddell {S}ea}, ' ... 
'journal = {Polar Science}, ' ...
'volume = {35}, ' ...
'pages = {100917}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chionobathyscus-dewitti.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
