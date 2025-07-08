function [data, auxData, metaData, txtData, weights] = mydata_Ammodytes_personatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Uranoscopiformes'; 
metaData.family     = 'Ammodytidae';
metaData.species    = 'Ammodytes_personatus'; 
metaData.species_en = 'Pacific sand lance'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW','MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 20];

%% set data
% zero-variate data

data.ab = 32;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(19.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 4.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Matt2020';   
  temp.am = C2K(19.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 8;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 15;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.9 mm of Ammodytes_marinus: pi/6*0.09^3'; 
data.Wwp = 8.3; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01000*Lp^3.23, see F1';
data.Wwi = 62.9; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.23, see F1; max published weight 10.60 g';

data.Ri  = 15.9e3/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(28.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 0.35*Li^3.96';

% uni-variate data
% time-length
data.tL = [  ... % time since birth (d), total length (cm)
0.003	6.240
0.006	2.782
0.013	4.625
0.014	3.083
0.017	5.715
0.018	4.099
0.019	3.798
0.020	3.272
0.026	2.934
0.990	6.955
0.991	7.406
0.992	7.932
0.997	6.730
0.998	8.346
1.005	6.128
1.006	6.504
1.007	7.331
1.008	7.594
1.018	7.144
1.019	8.084
1.965	8.157
1.978	6.954
1.979	7.669
1.980	9.285
1.981	9.999
1.984	7.481
1.985	9.736
1.990	7.970
1.991	8.571
1.997	8.910
2.003	9.549
2.010	8.459
2.011	10.640
2.970	12.631
2.976	11.804
2.986	8.195
2.987	8.609
2.988	9.361
2.989	9.624
2.990	10.225
2.991	11.316
2.992	13.045
2.995	8.384
2.996	10.677
3.002	8.985
3.003	11.429
3.008	12.181
3.981	10.864
3.987	12.255
3.994	12.030];
data.tL(:,1) = 365 * (1.8+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Matt2020'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data from CEG, N coast'};
% set2 = {'tW','tW1'}; subtitle2 = {'Data from CEG, N coast'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperature (C) in tL data is assumed to vary as T(t) = 9+5*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.23';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CTLR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46573108'; % Ency of Life
metaData.links.id_Wiki = 'Ammodytes'; % Wikipedia
metaData.links.id_ADW = 'Ammodytes_personatus'; % ADW
metaData.links.id_Taxo = '160650'; % Taxonomicon
metaData.links.id_WoRMS = '272967'; % WoRMS
metaData.links.id_fishbase = 'Ammodytes-personatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ammodytes}}';
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
bibkey = 'Matt2020'; type = 'Article'; bib = [ ... 
'author = {Mary Elizabeth Matta}, ' ... 
'year = {2020}, ' ...
'title = {AGE AND GROWTH OF {P}ACIFIC SAND LANCE (\emph{Ammodytes personatus}) AT THE LATITUDINAL EXTREMES OF THE {G}ULF OF {A}LASKA LARGE MARINE ECOSYSTEM}, ' ...
'journal = {Nothwestern Naturalist}, ' ...
'volume = {101}, ' ...
'pages = {34–49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ammodytes-personatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

