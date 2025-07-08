function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_bohar
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_bohar'; 
metaData.species_en = 'Two-spot red snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 05];

%% set data
% zero-variate data

data.ab = 4.2;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 55*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 42.9; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'range 28 to 40 cm, which does not include 52 cm';
data.Li  = 90;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwp = 1e3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01349*Lp^2.99, see F1';
data.Wwi = 9.4e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^2.99, see F1; max published weight 12.5 kg';

data.Ri  = 2.2e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.85';
  
% uni-variate data
% time-length
data.tL_P = [ ... % time since hatch (yr), std length (cm)
1.114	14.453
5.109	21.484
5.175	24.414
6.026	27.344
7.009	32.617
8.908	36.523
8.908	33.594
9.760	37.891
10.939	38.672
11.987	39.063
13.952	43.555
14.017	39.453
15.000	39.063
17.031	43.945
17.948	48.828
19.978	47.461
21.092	47.070
22.074	51.563
24.039	50.586
27.969	45.703];
data.tL_P(:,1) = (0 + data.tL_P(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_P,1); if data.tL_P(i,1)<=data.tL_P(i-1,1);data.tL_P(i,1)=data.tL_P(i-1,1)+1e-8;end;end
units.tL_P = {'d', 'cm'};  label.tL_P = {'time since birth', 'std length','Palmyra'};  
temp.tL_P = C2K(28);  units.temp.tL_P = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_P = 'RuttHami2011';
comment.tL_P = 'Data from Palmyra'; 
%
data.tL_K = [ ... % time since hatch (yr), std length (cm)
0.066	6.055
0.262	7.031
1.769	16.797
1.900	15.820
1.900	14.062
1.965	18.164
2.817	20.117
2.817	19.336
2.882	17.773
2.948	21.289
3.013	22.266
3.996	23.047
3.996	24.219
4.061	18.945
4.061	20.508
4.978	26.172
5.109	21.094
5.961	20.898
5.961	24.023
5.961	28.711
6.943	25.977
7.009	23.242
7.074	31.055
7.074	29.492
7.074	27.344
7.795	27.539
7.795	28.906
7.860	33.008
7.926	25.586
7.926	31.641
8.843	31.055
8.843	27.148
8.908	30.273
8.908	26.172
10.939	32.617];
data.tL_K(:,1) = (0 + data.tL_K(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_K,1); if data.tL_K(i,1)<=data.tL_K(i-1,1);data.tL_K(i,1)=data.tL_K(i-1,1)+1e-8;end;end
units.tL_K = {'d', 'cm'};  label.tL_K = {'time since birth', 'std length','Kiritimati'};  
temp.tL_K = C2K(28);  units.temp.tL_K = 'K'; label.temp.tL_K = 'temperature';
bibkey.tL_K = 'RuttHami2011';
comment.tL_K = 'Data from Kiritimati'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_P = 5 * weights.tL_P;
weights.tL_K = 5 * weights.tL_K;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight Ww in g = 0.01349*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Group plots
set1 = {'tL_P','tL_K'}; subtitle1 = {'Data from Palmyra, Kiritimati'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '3WG87'; % Cat of Life
metaData.links.id_ITIS = '168865'; % ITIS
metaData.links.id_EoL = '46580736'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_bohar'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_bohar'; % ADW
metaData.links.id_Taxo = '106212'; % Taxonomicon
metaData.links.id_WoRMS = '218479'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-bohar'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_bohar}}';
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
bibkey = 'RuttHami2011'; type = 'Article'; bib = [ ...
'doi = {10.1371/journal.pone.0021062}, ' ...
'author = {Ruttenberg B.I. and Hamilton, S.L. and Walsh, S.M. and Donovan, M.K. and Friedlander, A. and et al.}, ' ...
'year = {2011}, ' ...
'title = {Predator-Induced Demographic Shifts in Coral Reef Fish Assemblages}, ' ... 
'journal = {PLoSONE}, ' ...
'volume = {6(6)}, '...
'pages = {e21062}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-bohar.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
