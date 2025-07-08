function [data, auxData, metaData, txtData, weights] = mydata_Stereolepis_gigas
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Polyprionidae';
metaData.species    = 'Stereolepis_gigas'; 
metaData.species_en = 'Giant sea bass'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.9); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 14]; 

%% set data
% zero-variate data

data.tj = 26.8;  units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'BensAlle2018';   
  temp.tj = C2K(20.9);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 76*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'HawkAlle2014';   
  temp.am = C2K(20.9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lj  = 1.06; units.Lj  = 'cm';  label.Lj  = 'standard length at metam'; bibkey.Lj  = 'BensAlle2018'; 
  comment.tL = 'TL 1.44 cm';
data.Lp  = 65; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'HawkAlle2014';
  comment.Lp = 'read from tL data for tp = 11 yr, but this value is uncertain';
data.Li  = 250;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 1.25 mm of  	Polyprion americanus: pi/6*0.125^3'; 
data.Wwi = 255.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri = 1e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length data 
data.tL = [ ... % time since birth (yr), total length (cm)
1.222	13.938
2.848	40.260
2.848	39.099
4.790	48.402
5.708	56.148
5.916	49.960
5.917	48.413
5.918	46.092
5.920	40.676
6.731	58.092
7.650	63.904
7.861	51.914
7.862	49.979
8.779	58.886
8.783	52.309
9.091	49.991
9.187	62.371
9.786	92.551
9.908	55.415
10.009	58.511
10.716	77.860
10.721	67.415
10.803	107.648
10.807	99.137
10.809	96.429
10.814	85.985
11.016	91.789
11.634	84.058
11.727	104.175
11.951	65.493
12.767	73.238
12.768	70.143
13.781	92.977
13.890	79.825
14.904	100.338
14.912	85.637
15.937	84.100
17.752	139.437
17.869	111.585
18.987	127.456
19.812	116.633
21.032	134.826
21.743	147.986
21.861	116.652
22.777	127.880
22.984	124.400
22.984	124.013
22.986	120.532
23.679	166.573
23.681	162.318
23.796	138.335
24.709	156.912
27.900	126.382
34.644	157.782
35.865	173.268
39.655	174.078
41.001	145.464
53.886	187.368
61.973	198.665
63.720	187.463
75.906	192.997];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(20.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HawkAlle2014';

data.tL1 = [ ... time since birth (d), total length(cm)
30.784	1.742
31.788	1.960
32.952	2.008
33.305	2.565
36.454	2.395
38.100	2.008
39.495	3.823
42.133	3.315
44.946	3.048
49.487	4.597
51.471	4.355
51.490	4.887
51.626	4.065
52.621	4.040
56.672	5.806
56.809	5.032
57.618	4.452
58.480	5.298
59.468	5.081
61.351	6.605
66.523	7.282
68.481	6.339
80.640	7.355
83.315	7.839];
data.tL(:,2) = data.tL(:,2) * 1.06/1.44; % convert TL to SL
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'standard length'};  
temp.tL1    = C2K(32);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'BensAlle2018';
comment.tL1 = 'In view of the high growth rate, the temperatre is guessed high';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.6; units.psd.k   = '-';  label.psd.k = 'maintenance ratio'; weights.psd.k = 3;  

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'all temperature are guessed, based on the preferred temperature, as given in fishbase';
D3 = 'in view of low [p_M], k_J = set free and k = 0.6 is used as pseudo-data';
metaData.discussion = struct('D1',D1,'D2',D2,'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01479 * (TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52DZG'; % Cat of Life
metaData.links.id_ITIS = '167918'; % ITIS
metaData.links.id_EoL = '46578887'; % Ency of Life
metaData.links.id_Wiki = 'Stereolepis_gigas'; % Wikipedia
metaData.links.id_ADW = 'Stereolepis_gigas'; % ADW
metaData.links.id_Taxo = '45099'; % Taxonomicon
metaData.links.id_WoRMS = '282884'; % WoRMS
metaData.links.id_fishbase = 'Stereolepis-gigas'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stereolepis_gigas}}';
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
bibkey = 'BensAlle2018'; type = 'Article'; bib = [ ... 
'author = {Stephanie A. Benseman and Larry G. Allen}, ' ... 
'year = {2018}, ' ...
'title = {Distribution and Recruitment of Young-of-the-Year Giant Sea Bass, \emph{Stereolepis gigas}, off Southern {C}alifornia}, ' ...
'journal = {Copeia}, ' ...
'volume = {106}, ' ...
'pages = {312-320}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HawkAlle2014'; type = 'Article'; bib = [ ...
'author = {Holly A. Hawk and Larry G. Allen}, ' ... 
'year = {2014}, ' ...
'title = {Age and Growth of the Giant Sea Bass, Stereolepis gigas}, ' ...
'journal = {CalCOFI Rep.}, ' ...
'volume = {55}, ' ...
'pages = {43}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Stereolepis-gigas.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
