function [data, auxData, metaData, txtData, weights] = mydata_Orectolobus_hutchinsi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Orectolobiformes'; 
metaData.family     = 'Orectolobidae';
metaData.species    = 'Orectolobus_hutchinsi'; 
metaData.species_en = 'Western wobbegong'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MISE', 'MPSW'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 30];

%% set data
% zero-variate data;
data.ab = 353;     units.ab = 'd';   label.ab = 'age at birth';                bibkey.ab = 'guess';    
  temp.ab = C2K(18.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25*365;  units.am = 'd';   label.am = 'life span';                    bibkey.am = 'ChidSimp2007';   
  temp.am = C2K(18.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 24;  units.Lb  = 'cm'; label.Lb  = 'total length at birth';    bibkey.Lb  = 'ChidSimp2007';
  comment.Lb = '22-26 cm';
data.Lp  = 110;  units.Lp = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'ChidSimp2007';
data.Lpm  = 112;  units.Lpm = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'ChidSimp2007';
data.Li  = 149; units.Li = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb  = 78.7;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';        bibkey.Wwb  = {'HuveStea2013','fishbase'};
  comment.Wwi = 'based on 0.00389*Lb^3.12, see F1';
data.Wwi  = 23.5e3;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';

data.Ri  = 25/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';         bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
6.998	87.529
7.051	100.240
7.956	85.670
7.956	96.533
7.956	104.160
7.956	105.547
7.956	123.575
8.009	112.018
8.940	107.387
8.967	88.665
8.993	97.910
9.020	117.787
10.058	117.777
10.058	95.589
10.936	130.480
10.989	94.886
10.989	103.900
11.894	130.702
12.027	125.154
12.027	128.389
12.027	107.126
12.958	97.872
13.011	115.206
13.969	94.164
14.049	105.026
15.007	130.903
15.033	144.077
15.060	106.172
16.044	133.204
16.044	122.341
17.082	129.727
21.100	139.627
22.031	134.302];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};
temp.tL_f = C2K(18.3); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ChidSimp2007';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
3.911	63.521
4.949	85.931
6.146	91.004
7.929	100.000
7.956	102.080
7.956	93.529
7.982	127.042
8.914	90.053
8.940	99.760
8.940	101.609
8.940	139.051
8.967	98.373
8.967	111.084
8.967	119.867
9.020	105.999
9.925	137.423
9.925	88.425
10.004	132.107
10.031	129.564
10.031	102.523
10.031	91.197
10.882	138.570
10.882	142.037
10.909	131.867
10.909	142.499
10.936	96.736
10.936	98.122
10.936	100.203
10.936	133.485
10.962	127.937
11.734	131.859
11.840	105.048
11.867	146.650
11.867	101.349
11.867	99.038
11.920	102.735
11.947	144.338
11.973	134.630
12.080	88.404
12.958	128.380
12.958	130.460
13.064	137.855
13.091	126.530
13.969	110.343
14.075	135.766
15.060	141.072
15.060	138.298
15.086	110.563
16.949	138.280
16.976	141.054
18.971	142.421
19.078	141.033];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};
temp.tL_m = C2K(18.3); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ChidSimp2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12 ';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '754MS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46559689'; % Ency of Life
metaData.links.id_Wiki = 'Orectolobus_hutchinsi'; % Wikipedia
metaData.links.id_ADW = 'Orectolobus_hutchinsi'; % ADW
metaData.links.id_Taxo = '1683997'; % Taxonomicon
metaData.links.id_WoRMS = '281929'; % WoRMS
metaData.links.id_fishbase = 'Orectolobus-hutchinsi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Orectolobus_hutchinsi}}';  
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
bibkey = 'ChidSimp2007'; type = 'Article'; bib = [ ...
'doi = {10.1071/MF06249}, ' ...
'author = {Chidlow, Justin A. and Simpfendorfer, Colin A. and Russ, Garry R.}, ' ...
'year = {2007}, ' ...
'title = {Variable growth band deposition leads to age and growth uncertainty in the western wobbegong shark, \emph{Orectolobus hutchinsi}}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {58(9)}, '...
'pages = {856-865}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Orectolobus-hutchinsi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
