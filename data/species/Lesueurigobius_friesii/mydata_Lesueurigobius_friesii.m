function [data, auxData, metaData, txtData, weights] = mydata_Lesueurigobius_friesii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Lesueurigobius_friesii'; 
metaData.species_en = 'Fries''s goby'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MANE','MAE','MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.4); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 26];

%% set data
% zero-variate data

data.ab = 10.5;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(10.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(10.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 4.8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'GibsEzzi1978'; 
data.Li  = 13;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Wiki';

data.Wwb = 1.6e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.5 mm and width of 0.45 mm of G.niger: pi/6*0.15*0.045^2';
data.Wwp = 0.72;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','GibsEzzi1978'};
  comment.Wwp = 'based on 0.00603*Lp^3.05, see F1';
data.Wwi = 15.1;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00603*Li^3.05, see F1';

% uni-variate data
% time-length
data.tL_f = [... %  yr class (yr), std length (cm)
-0.467	0.448
-0.281	1.402
0.032	1.531
0.270	2.450
1.294	4.570
1.532	5.360
1.792	5.124
2.105	5.265
2.289	5.724
2.653	5.476
2.888	5.582
3.333	5.935
3.906	5.946
4.375	5.958
4.819	6.052
5.418	6.051
6.488	6.191
6.931	6.167
7.244	6.285
7.740	6.532
7.895	6.284
8.260	6.307
8.522	6.507
9.539	6.754
10.321	6.517
10.529	6.517
10.792	7.000];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); 
data.tL_f(:,2) = data.tL_f(:,2)*1.27; % convert SL to TL see F2
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f   = C2K(10.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GibsEzzi1978'; 
%
data.tL_m = [... %  yr class (yr), std length (cm)
0.536	3.864
0.796	3.746
0.979	3.828
1.267	4.323
1.557	5.018
1.766	5.360
2.078	5.124
2.261	5.241
2.549	5.571
2.810	5.523
3.044	5.570
3.358	5.711
3.619	5.852
3.880	5.852
4.088	5.828
4.323	5.828
4.636	6.040
4.923	5.945
5.157	5.957
5.444	5.957
5.627	6.169
5.940	6.062
6.200	6.062
6.409	6.085
6.670	6.297
6.930	6.049
7.164	5.931
7.452	6.202
7.766	6.414
10.815	6.410];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); 
data.tL_m(:,2) = data.tL_m(:,2)*1.27; % convert SL to TL see F2
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m   = C2K(10.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GibsEzzi1978'; 

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
4.398	3887.755
4.490	3486.514
4.500	2682.579
4.571	4441.972
4.684	4568.540
4.786	4418.641
4.908	5223.686
4.908	3866.902
5.306	5503.401
5.316	7186.904
5.480	7062.643
5.500	8520.100
5.510	7917.171
5.592	10430.417
5.602	8269.699
5.796	8547.704
5.898	9126.448
5.898	8322.428
6.020	6765.665
6.041	10886.439
6.102	9027.655
6.112	6640.806
6.214	7370.304
6.327	7622.500
6.429	10286.671
6.510	8704.440
6.531	10764.913
6.816	10315.045];
data.LN(:,1) = data.LN(:,1)*1.27; % convert SL to TL see F2
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN   = C2K(10.4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'GibsEzzi1978'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Weight-length: Ww in g = 0.00603*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
F2 = 'TL = 1.27 * SL';
metaData.bibkey.F2 = 'GibsEzzi1978';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6PQXZ'; % Cat of Life
metaData.links.id_ITIS = '172036'; % ITIS
metaData.links.id_EoL = '46575257'; % Ency of Life
metaData.links.id_Wiki = 'Lesueurigobius_friesii'; % Wikipedia
metaData.links.id_ADW = 'Lesueurigobius_friesii'; % ADW
metaData.links.id_Taxo = '178687'; % Taxonomicon
metaData.links.id_WoRMS = '126904'; % WoRMS
metaData.links.id_fishbase = 'Lesueurigobius-friesii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lesueurigobius_friesii}}';
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
bibkey = 'GibsEzzi1978'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1970.tb03286.x}, ' ...
'author = {R. N. Gibson and I. A. Ezzi}, ' ... 
'year = {1978}, ' ...
'title = {The biology of a {S}cottish population of {F}ries'' goby, \emph{Lesueurigobius friesii}}, ' ...
'journal = {Journal of Fish Biology }, ' ...
'volume = {12}, ' ...
'pages = {371–389}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Lesueurigobius-friesii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

