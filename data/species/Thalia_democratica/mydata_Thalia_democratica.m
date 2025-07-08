function [data, auxData, metaData, txtData, weights] = mydata_Thalia_democratica

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Thaliacea'; 
metaData.order      = 'Salpida'; 
metaData.family     = 'Salpidae';
metaData.species    = 'Thalia_democratica'; 
metaData.species_en = 'Salp'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'Aa'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-dL'; 'L-N'; 'L-F'; 'WC-JX'}; % tags for different types of uni-variate data

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2011 10 31];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Goncalo Marques'; 'Bas Kooijman'};                             
metaData.date_mod_1     = [2015 03 30];                          
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 04 27]; 

%% set data
% zero-variate data;
data.ab = 18/24;units.ab = 'd';    label.ab = 'age at birth';   bibkey.ab = {'Hens2009','BorgMoll1986'};    
  temp.ab = C2K(21); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 1;  units.ap = 'd';    label.ap = 'age at puberty';   bibkey.ap = 'BorgMoll1986';
  temp.ap = C2K(21); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 2.75; units.am = 'd';    label.am = 'life span';      bibkey.am = {'Hens2009','BorgMoll1986'};   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb_asex  = 0.3;   units.Lb_asex  = 'cm';  label.Lb_asex  = 'length at birth, asex generation';   bibkey.Lb_asex  = 'Hero1972';
data.Lb_sex   = 0.175; units.Lb_sex  = 'cm';   label.Lb_sex  = 'length at birth, sex generation';     bibkey.Lb_sex  = 'Hero1972';
data.Lp_asex  = 0.54;  units.Lp_asex  = 'cm';  label.Lp_asex  = 'length at puberty, asex generation'; bibkey.Lp_asex  = 'Hero1972';
data.Li_asex  = 1.24;  units.Li_asex  = 'cm';  label.Li_asex  = 'ultimate length, asex generation';   bibkey.Li_asex  = 'Hero1972';

% wet weight =  4 * 69 * 1.62 Length (mm)^1.93; mug wet weight; 
% factor 4 because actual weights were larger
data.Wwb_asex = 4 * 69e-6 * 1.62 * (10 * data.Lb_asex)^1.93; units.Wwb_asex = 'g'; label.Wwb_asex = 'wet weight at birth, asex generation';   bibkey.Wwb_asex = 'Hero1972';
data.Wwp_asex = 4 * 69e-6 * 1.62 * (10 * data.Lp_asex)^1.93; units.Wwp_asex = 'g'; label.Wwp_asex = 'wet weight at puberty, asex generation'; bibkey.Wwp_asex = 'Hero1972';
data.Wwi_asex = 4 * 69e-6 * 1.62 * (10 * data.Li_asex)^1.93; units.Wwi_asex = 'g'; label.Wwi_asex = 'ultimate wet weight, asex generation';   bibkey.Wwi_asex = 'Hero1972';

% asexual reproduction (budding, like foetal development)
data.Ri_asex  = 70 * 24/ 5; units.Ri_asex  = '#/d';label.Ri_asex  = 'maximum reprod rate, asex generation';  bibkey.Ri_asex  = 'BorgMoll1986';   
  temp.Ri_asex = C2K(20); units.temp.Ri_asex = 'K'; label.temp.Ri_asex = 'temperature';

% uni-variate data at f
% Fig 14of Hero1972 measured at sea (black circles): asexual stage
data.LdL = [ ... % length in mm, % increase in length/h
0.2918	21.3746
0.4826	19.9002
0.7788	25.3910
1.5606	22.5641
2.7208	25.3082
2.8518	19.9311
3.8278	18.5669
4.4271	23.8393
5.5228	11.7780
6.4441	4.2077
7.6505	3.4375
8.6644	1.7512
9.3667	1.0698];
data.LdL(:,1) = data.LdL(:,1)/ 10;  % convert mm to cm
data.LdL(:,2) = data.LdL(:,1) .* data.LdL(:,2) * 24/ 100; % cm/d, growth rate dL/dtdata.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.LdL = {'cm', 'cm/d'};   label.LdL = {'length', 'increase in length'};  bibkey.LdL = 'Hero1972';
  temp.LdL = C2K(25); units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
%
% Data from HeroBenh1985 Fig 1: asexual stage. T = 273 + 21 K  (Hens2009)
% 1 chain each 5 h
data.LN = [ ... % length (mm), buds per chain
5.467	38.559
5.582	32.332
6.206	41.604
6.851	35.123
6.942	33.147
6.960	48.689
7.003	38.945
7.368	36.530
7.442	30.098
7.473	38.386
7.546	31.540
7.683	36.710
7.976	36.063
8.160	43.301
8.180	32.729
8.267	51.063
8.277	48.472
8.306	45.568
8.369	36.029
8.492	48.039
8.667	52.790
9.075	51.408
9.933	59.935
10.004	63.245
10.466	60.614
11.591	72.331
11.907	67.329];
data.LN(:,1) = data.LN(:,1)/10; % convert to cm
units.LN = {'cm', '#'};     label.LN = {'length', 'buds per chain'};  bibkey.LN = 'Hens2009';
  temp.LN = C2K(21); units.temp.LN = 'K'; label.temp.LN = 'temperature';
%
% Data from Mull1983 Fig 1b; T = 273 + 20 K: asexual stage
data.LF = [ ... % length (mm), filtering rate (ml/h)
1.833	1.121
1.929	0.234
3.196	2.383
3.198	1.168
3.431	2.617
3.502	2.009
3.832	1.729
4.016	4.252
4.065	3.037
4.114	2.243
4.228	3.925
4.796	2.430
4.811	7.196
5.397	8.224
5.649	12.383
5.651	10.888
5.697	11.729
5.700	10.047
5.884	12.617
5.886	10.981
5.949	15.280
5.956	24.953
6.005	10.514
6.016	17.477
6.026	12.009
6.074	11.355
6.326	15.280
6.632	28.598
6.705	14.065
6.710	11.121
7.233	21.402
7.273	25.140
7.487	23.879
7.543	19.019
7.593	17.336
7.787	27.570
7.877	16.215
7.918	19.766
8.164	26.776
8.200	20.140
8.936	29.720
9.516	47.804];
data.LF(:,1) = data.LF(:,1)/10; % convert mm to cm
units.LF = {'cm', 'ml/h'};     label.LF = {'length', 'filtering rate'};  bibkey.LF = 'Mull1983';
  temp.LF = C2K(20); units.temp.LF = 'K'; label.temp.LF = 'temperature';
%
% Data from Deib1982 Fig 5 T = 273 + 20.6
% feeding on Isochrysis galbana (4-6 mum diameter)
data.WJX = [ ... weight (mug C), ingestion rate (10^6 mum^3/d/ind)
1.639	7.107
2.690	8.510
3.678	5.965
3.715	10.445
3.805	15.442
4.610	12.666
4.681	9.487
4.779	6.304
5.531	14.355
6.294	16.335
6.336	11.842
7.026	15.945
7.139	8.274
7.285	14.582
7.304	22.758
7.740	18.725
10.065	27.825
13.031	31.010
14.992	41.492
15.000	22.493
15.002	67.875
16.035	72.975
17.043	34.016
19.104	75.351
20.058	113.710];
units.WJX = {'mug C', '10^6 mum^3/d'}; label.WJX = {'weight', 'ingestion rate'};  bibkey.WJX = 'Deib1982';
  temp.WJX = C2K(20.6); units.temp.WJX = 'K'; label.temp.WJX = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 0 * weights.LdL; % ignore LdL

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = weights.psd.p_M/100;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion
D1 = [ ...
'This file is on the asexual (oozooid) stage, treating budding as foetal developemnt.',...
'Notice that size at birth of asexual stage is larger than that of sexual stage which affects reprodcutive output in #/time'];
D2 = 'Parameter estimates tuned by hand'; 
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '55ZZ6'; % Cat of Life
metaData.links.id_ITIS = '159659'; % ITIS
metaData.links.id_EoL = '46585574'; % Ency of Life
metaData.links.id_Wiki = 'Thalia_(tunicate)'; % Wikipedia
metaData.links.id_ADW = 'Thalia_democratica'; % ADW
metaData.links.id_Taxo = '959814'; % Taxonomicon
metaData.links.id_WoRMS = '137279'; % WoRMS

%% Facts
F1 = [ ...
'Length measurements: from oral opening to posterior ridge of gut; ',...
'Carbon Weight (mug C) =  1.62 Length (mm)^1.93;',...
'increase in density with length probably linked to reproductive output (Bas-interpretation); ',...
'dry weight was 8.04% of wet weight; ',...
'ash-free dry weight was 46.5 % of dry weight; ',...
'carbon weight was 38.7 % of ash-free dry weight; ',...
'wet-weight = 69 * C-weight; ',...
'this result is inconsistent with observations; ',...
'Ww_i = 69e-6 * 1.62 * 10^1.93 = 0.0095 g, but HeroMcWi1988 measured 0.039667 g; ',...
'We_b = 60e-6 * 1.62 * 0.53^1.93 = 0.00003283 g, but HeroMcWi1988 measured 0.00011146 g; ',...
' Wet weight excludes water in internal cavity; ',...
'Carbon was found to be a better reference measurement than either wet or dry weight; ',...
' C: N ratio was 3.81 : 1; ',...
'Salp weight increases as length squared rather than cubed, because tissue density declines with growth between 3 and 10 mm; ',...
'Salp tissue density is much closer to that of other marine invertebrates, such as molluscs and crustaceans, than was previously reported; ',...
'Contrary to expectations, the ratio of dry and ash-free dry weight to wet weight is high during the most rapid growth period, from 2 to 7 mm; ',...
'While the average density of T. democratica in relation to wet weight is now seen to be comparable to that of molluscs and chaetognaths; ',...
 '(not, as previously thought, to that of medusae and siphonophores), the density of 4 mm individuals reaches that of the arthropods;'];
metaData.bibkey.F1 = 'HeroMcWi1988';

F2 = [ ...
'sexual generation has placental development, one asexual embryo per parent; ',...
'sexual stage lives in chains, asexual one solitary; strict alternation; ',...
'asexual parent buds off 20 - 80 sexual embryos at 10 mm born on a chain, fed via blood; ',...
'the sexual neonates need 30 min to leave the chain; ',...
'sexual embryos are 1.5 till 2 mm at budding, asexual embryos are 3 mm at birth; ',...
'length measurements: max length of internal structure, excluding transparent test; '];
metaData.bibkey.F2 = 'Hero1972';

F3 = [ ...
'Sexual: 5h release from chain; 18h female, 2h male (20-22 C). ', ...
'Asexual: 24h juvenile; 24 h adult, chain forming each 5 h (20-22 C). ', ...
'the sexual individuals (blastozooids) are sequential hermaphrodites; ', ...
'first maturing as females, fertilised by older chains; ', ...
'after relase of the first baby, male gonads develop.'];
metaData.bibkey.F3 = 'Hens2009';

metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Salp}}';   
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
bibkey = 'HeroMcWi1988'; type = 'Article'; bib = [ ... 
'author = {Heron, A. C. and McWilliam, P. S. and Dal Pont, G.}, ' ...
'year = {1988}, ' ...
'title  = {Length-weight relation in the salp \emph{Thalia democratica} and potential of salps as a source of food}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {42}, ' ...
'pages = {125--132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hero1972'; type = 'Article'; bib = [ ... 
'author = {Heron, A. C.}, ' ...
'year = {1972}, ' ...
'title  = {Population ecology of a colonizing species: the pelagic tunicate \emph{Thalia democratica} I: {I}ndividual growth rate and generation time}, ' ...
'journal = {Oecologia (Berl.)}, ' ...
'volume = {10}, ' ...
'pages = {269--293}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeroBenh1985'; type = 'Article'; bib = [ ... 
'author = {Heron, A. C. and Benham, E. E.}, ' ...
'year = {1985}, ' ...
'title  = {Life history parameters as indicators of grwoth rate in three salp populations}, ' ...
'journal = {J. Plankton Res.}, ' ...
'volume = {7}, ' ...
'pages = {279--288}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Deib1982'; type = 'Article'; bib = [ ... 
'author = {Deibel, D.}, ' ...
'year = {1982}, ' ...
'title  = {Laboratory-measured grazing and ingestion rates of the salp, \emph{Thalia democratica} {F}orsk\r{a}l, and the doliolid, \emph{Dolioletta gegenbauri} {U}ljanin ({T}unicata, {T}haliacea)}, ' ...
'journal = {J. Plankton Res.}, ' ...
'volume = {4}, ' ...
'pages = {189--201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BorgMoll1986'; type = 'Article'; bib = [ ... 
'author = {Borgne, R. le and Moll, P.}, ' ...
'year = {1986}, ' ...
'title  = {Growth rates of the salp \emph{Thalia democratica} in {T}ikehau {A}toll ({T}uamotu {I}s.).}, ' ...
'journal = {Oceanogr. trop.}, ' ...
'volume = {21}, ' ...
'pages = {23--29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hens2009'; type = 'Phdthesis'; bib = [ ... 
'author = {Henschke, N.}, ' ...
'year = {2009}, ' ...
'title  = {Distribution and population structure of the salp \emph{Thalia democratica} in relation to water masses of the {T}asman {S}ea}, ' ...
'school = {Univ. New South Wales}, ' ...
'howpublished = {\url{http://www.famer.unsw.edu.au/publications/HenschkeHonoursThesis.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mull1983'; type = 'Article'; bib = [ ... 
'author = {Mullin, M. M.}, ' ...
'year = {1983}, ' ...
'title  = {In situ measurement of filtering rates of the salp, \emph{Thalia democratica}, on phytoplankton and bacteria}, ' ...
'journal = {J. Plankton Res.}, ' ...
'volume = {5}, ' ...
'pages = {279--288}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


