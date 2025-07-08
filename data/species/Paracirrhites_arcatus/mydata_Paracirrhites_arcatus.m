function [data, auxData, metaData, txtData, weights] = mydata_Paracirrhites_arcatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Cirrhitidae';
metaData.species    = 'Paracirrhites_arcatus'; 
metaData.species_en = 'Arc-eye hawkfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'bpMp','piMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
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
data.ab = 5.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'RuttHami2011';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 7.3;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'Kelo2019';
data.Li = 20;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 4.2;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00933*Li^3.07, see F1';
data.Wwi = 92;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.07, see F1';
 
data.GSI = 0.06; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL_P = [ ... % time since hatch (yr), std length (cm)
0.427	3.321
0.525	3.827
0.853	4.477
0.952	4.224
1.050	4.043
1.969	4.910
1.969	4.838
2.002	5.054
2.035	4.513
2.068	5.848
2.068	5.343
2.921	6.065
3.085	6.318
3.118	7.437
3.972	5.415
4.004	5.776
4.004	5.957
4.004	6.137
4.004	6.390
4.004	6.751
4.923	6.318
4.956	6.498
4.956	6.137
4.956	5.812
4.989	5.957
5.055	7.653
5.055	7.148
5.088	6.751
6.072	7.148
6.072	7.617
6.105	8.520
6.105	9.206
6.138	7.906
6.958	9.170
7.057	8.773
7.090	8.339
8.042	8.736
8.074	7.581];
data.tL_P(:,1) = (0 + data.tL_P(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_P,1); if data.tL_P(i,1)<=data.tL_P(i-1,1);data.tL_P(i,1)=data.tL_P(i-1,1)+1e-8;end;end
units.tL_P = {'d', 'cm'};  label.tL_P = {'time since birth', 'std length','Palmyra'};  
temp.tL_P = C2K(27.5);  units.temp.tL_P = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_P = 'RuttHami2011';
comment.tL_P = 'Data from Palmyra'; 
%
data.tL_K = [ ... % time since hatch (yr), std length (cm)
3.020	5.451
3.085	5.776
3.085	6.390
5.022	7.545
5.055	7.040
5.941	6.245
6.007	6.859
6.007	7.004
6.991	7.365
7.024	7.581
7.024	7.076
7.024	6.426
7.976	8.484
8.009	7.148
8.042	8.231
8.074	6.787
9.026	8.700
9.026	8.556
9.059	8.123
9.092	7.690
10.011	7.437
10.044	8.339
10.044	8.917
10.996	9.061
11.028	8.014
12.013	8.845
12.998	9.097
14.015	9.386];
data.tL_K(:,1) = (0 + data.tL_K(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_K,1); if data.tL_K(i,1)<=data.tL_K(i-1,1);data.tL_K(i,1)=data.tL_K(i-1,1)+1e-8;end;end
units.tL_K = {'d', 'cm'};  label.tL_K = {'time since birth', 'std length','Kiritimati'};  
temp.tL_K = C2K(27.5);  units.temp.tL_K = 'K'; label.temp.tL_K = 'temperature';
bibkey.tL_K = 'RuttHami2011';
comment.tL_K = 'Data from Kiritimati'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_P = weights.tL_P * 3;
weights.tL_K = weights.tL_K * 3;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = .1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_P','tL_K'}; subtitle1 = {'Data from Palmyra, Kiritimati'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CQ2S'; % Cat of Life
metaData.links.id_ITIS = '170228'; % ITIS
metaData.links.id_EoL = '46581266'; % Ency of Life
metaData.links.id_Wiki = 'Paracirrhites_arcatus'; % Wikipedia
metaData.links.id_ADW = 'Paracirrhites_arcatus'; % ADW
metaData.links.id_Taxo = '106008'; % Taxonomicon
metaData.links.id_WoRMS = '218866'; % WoRMS
metaData.links.id_fishbase = 'Paracirrhites-arcatus'; % fishbase

%% References46581266
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Paracirrhites_arcatus}}';  
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
'title = {Predator-InducedDemographic Shifts in Coral Reef Fish Assemblages}, ' ... 
'journal = {PLoSONE}, ' ...
'volume = {6(6)}, '...
'pages = {e21062}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kelo2019'; type = 'phdthesis'; bib = [ ...
'author = {Mildres Kelokelo}, ' ...
'year = {2011}, ' ...
'title = {Sexuality and sexual maturity of the arc-eye hawkfish, \emph{Paracirrhites_arcatus} ({C}irrhitidae)}, ' ... 
'school = {University of Guam}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Paracirrhites-arcatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

