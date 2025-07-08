function [data, auxData, metaData, txtData, weights] = mydata_Triakis_megalopterus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Triakis_megalopterus'; 
metaData.species_en = 'Sharptooth houndshark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.3); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'WWi'; 'Ri'};  
metaData.data_1     = {'t-L_f'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 02];

%% set data
% zero-variate data;
data.ab = 365*11.5/12; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(19.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Mustelus_antarcticus';
data.am = 25*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'MoliBlas2017';   
  temp.am = C2K(19.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 31;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'fishbase';
data.Lp = 58.3;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty for females';bibkey.Lp  = 'fishbase';
data.Li  = 92;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwp = 840;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00240*Lp^3.14, see F1';
data.Wwi = 3.5e3;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00240*Li^3.14, see F1';

data.Ri  = 9/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(19.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6-12 pups per litter, 1 litter per 2 yr assumed';  
  
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.034	40.863
0.009	35.979
0.011	44.862
1.941	73.357
1.983	64.920
2.904	78.722
2.905	84.052
3.034	73.840
4.001	95.639
4.044	90.754
4.046	100.526
4.130	86.760
5.007	100.116
6.008	80.164
6.011	93.489
6.013	102.373
8.943	106.474
8.990	121.577
8.991	126.463
9.962	164.696
10.085	131.832
11.916	110.577
12.004	115.022
12.008	132.344
13.931	130.636
13.935	146.182
13.969	105.320
14.065	142.189
14.982	137.336
14.985	148.884
14.986	154.214
14.987	157.323
16.032	141.815
16.033	148.477
16.034	151.587
16.079	156.474
17.040	153.399
17.042	162.282
17.961	166.757
18.002	153.877
18.004	164.093
18.088	151.215
19.008	158.355
19.962	129.074
20.015	167.274
20.017	173.936
20.146	163.281
21.018	156.649
22.941	154.497
23.030	161.163
23.073	158.943
24.123	164.755
25.040	160.346];
data.tL_f(:,1) = (0+data.tL_f(:,1))*365; % % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(19.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MoliBlas2017';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.009	38.200
0.011	45.307
2.070	63.146
5.051	97.897
5.881	98.370
6.975	101.963
7.067	121.065
7.191	94.864
7.902	138.417
7.982	111.326
8.027	116.657
8.069	107.331
11.050	143.859
11.969	150.998
12.009	135.454
12.056	147.892
13.106	150.150
13.977	138.189
14.025	155.957
15.991	153.806
17.037	140.962
17.082	147.626
20.053	143.734];
data.tL_m(:,1) = (0+data.tL_m(:,1))*365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(19.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BootFoul2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00240*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58597'; % Cat of Life
metaData.links.id_ITIS = '551511'; % ITIS
metaData.links.id_EoL = '46560014'; % Ency of Life
metaData.links.id_Wiki = '58597'; % Wikipedia
metaData.links.id_ADW = 'Triakis_megalopterus'; % ADW
metaData.links.id_Taxo = '41958'; % Taxonomicon
metaData.links.id_WoRMS = '220023'; % WoRMS
metaData.links.id_fishbase = 'Triakis-megalopterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...271393
'howpublished = {\url{http://en.wikipedia.org/wiki/Triakis_megalopterus}}';  
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
bibkey = 'BootFoul2011'; type = 'article'; bib = [ ... 
'author = {Anthony J. Booth and Alan J. Foulis and Malcolm J. Smale}, ' ...
'year = {2011}, ' ...
'title  = { Age validation, growth, mortality, and demographic modeling of spotted gully shark (\emph{Triakis megalopterus}) from the southeast coast of {S}outh {A}frica}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {109(1)}, ' ...
'pages = {101-111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Triakis-megalopterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

