function [data, auxData, metaData, txtData, weights] = mydata_Gallotia_simonyi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Gallotia_simonyi'; 
metaData.species_en = 'Simony''s Lizard'; % El Hierro giant lizard

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp

metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-N', 't-L'}; 

metaData.COMPLETE = 3; % using criteria of LikaKear2011

metaData.author   = {'Urtzi Enriquez-Urzelai'};    
metaData.date_subm = [2021 05 26];              
metaData.email    = {'urtzi.enriquez@gmail.com'};            
metaData.address  = {'Czech Academy of Sciences'};   

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nina.marn@gmail.com'}; 
metaData.date_acc    = [2021 06 02];

%% set data
% zero-variate data

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Lacerta agilis';
data.tp = 35*30;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'MoliRodr2004';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '35 months according to MolinaRodriguez2004';
data.am = 133*30;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'MoliRodr2004';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '133 months according to MolinaRodriguez2004';

data.Lb  = 5.29;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'MoliRodr2004';  
data.Lp  = 13.1;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'MoliRodr2004';  
data.Lpm  = 13.5;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty males';      bibkey.Lpm  = 'MoliRodr2004';  
data.Li  = 16.5;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'MoliRodr2004';  
data.Lim  = 19.4;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL males';         bibkey.Lim  = 'MoliRodr2004';  

data.Ww0 = 5.2;   units.Ww0 = 'g';  label.Ww0 = 'wet weight of eggs'; bibkey.Ww0 = 'MoliRodr2004';
  comment.Ww0 = 'mass of eggs';
data.Wwb = 3.95;   units.Wwb = 'g';  label.Wwb = 'wet weight of hatchlings'; bibkey.Wwb = 'MoliRodr2004';
  comment.Wwb = 'Body mass of hatchlings';
data.Wwi = 89.35;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Rome1999';
  comment.Wwi = 'Mean body mass';
data.Wwim = 151.03;   units.Wwim = 'g';  label.Wwim = 'ultimate wet males'; bibkey.Wwim = 'Rome1999';
  comment.Wwim = 'Mean body mass';

data.Ri  = 8.6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MoliRodr2004';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one clutch per year';

% univariate data
% length - yearly fecundity
data.LN = [ ... 
171.9491	6.8707
175.9138	6.8659
177.9099	6.8580
176.8887	7.7144
179.8871	8.5961
179.8871	9.5082
181.8863	7.6931
184.9269	6.8533
185.8660	6.8596
184.8843	8.5724
182.8942	9.5236
184.8843	9.5126
187.8884	10.4785
197.9703	8.5803
193.8653	11.4868
197.9247	12.5141
200.9555	9.5060];
data.LN(:,1) = data.LN(:,1) / 10; % convert mm to cm
units.LN = {'cm', '#'}; label.LN = {'length', 'yearly fecundity'};
temp.LN = C2K(21); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = {'RodrMoli1998'};

% t-L data for juveniles
data.tL_j = [ ... % time since birth (m), SVL (mm)
0.79177	58.86058
1.04306	64.0044
0.75762	64.95569
0.73414	69.14608
9.97764	69.18129
9.97338	69.94318
9.96057	72.22884
20.02838 75.12434
13.28983 77.95581
11.30561 82.13873
23.90078 83.901
21.94004 83.89353
20.253	85.02996
21.9283	85.98872
32.02813 83.17005
32.00679 86.9795
24.98599 90.19085
21.06558 89.98543
37.01988 92.14145
23.26161 97.9938
22.14118 97.98953
20.17404 99.1249
43.72642 95.02414
49.01536 100.94905
22.95376 102.94501
20.98661 104.08037
24.05711 105.99683
22.91428 109.99248
33.03117 104.12626
35.79916 110.04156
43.88275 117.11998
43.87741 118.07234
46.07771 125.31881];
data.tL_j(:,2) = data.tL_j(:,2) / 10; % convert mm to cm
data.tL_j(:,1) = data.tL_j(:,1) * 30; % convert months to days
units.tL_j  = {'d', 'cm'};  label.tL_j = {'time since birth', 'SVL', 'juvenile'};  
temp.tL_j   = C2K(21);  units.temp.tL_j = 'K'; label.temp.tL_j = 'temperature';
bibkey.tL_j = 'Rome1999';
comment.tL_j = 'Data for juveniles, temperature guessed';

% t-L data for adults
data.tL = [ ... % time since birth (m), SVL (mm)
36.61653	116.32694
42.45992	120.44773
42.13952	125.90063
43.52027	128.29406
45.40196	138.53095
56.39709	126.99627
56.38183	129.04164
58.62205	128.71219
59.45101	130.08007
57.38878	144.04679
67.49647	138.98484
67.45324	144.78008
72.59736	130.14729
79.46041	110.06875
83.31024	118.95207
93.31875	127.18507
91.33282	130.92492
94.32571	142.19022
79.43244	151.31861
70.16388	156.38485
81.30904	162.2373
79.35107	162.22728
79.32056	166.31804
79.29767	169.3861
95.03007	160.26201
90.97174	179.33216
127.25007	153.26768];
data.tL(:,2) = data.tL(:,2) / 10; % convert mm to cm
data.tL(:,1) = data.tL(:,1) * 30; % convert months to days
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL', 'adult'};  
temp.tL   = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Rome1999';
comment.tL = 'Data for adults of mixed sex, temperature guessed';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_j' , 'tL'}; subtitle1 = {'Data for juveniles, adults (mixed sex)'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Other common name: El Hierro giant lizard (Encyclopedia of Life)';
metaData.bibkey.F1 = {'EoL'};
F2 = 'One of the giant Gallotia species (also G. intermedia, G. stehlini)';
metaData.bibkey.F2 = {'MoliRodr2004'};
metaData.facts = struct('F1',F1, 'F2',F2);

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed to differ from females by {p_Am} and E_Hp';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3F6ZQ'; % Cat of Life
metaData.links.id_ITIS = '1155278'; % ITIS
metaData.links.id_EoL = '794632'; % Ency of Life
metaData.links.id_Wiki = 'Gallotia_simonyi'; % Wikipedia
metaData.links.id_ADW = 'Gallotia_simonyi'; % ADW
metaData.links.id_Taxo = '642477'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gallotia&species=simonyi'; % ReptileDB
metaData.links.id_AnAge = 'Gallotia_simonyi'; % AnAge


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoliRodr2004'; type = 'Article'; bib = [ ... 
'author = {M. Molina-Borja and M.A. Rodriguez-Dominguez}, ' ... 
'year = {2004}, ' ...
'title = {Evolution of biometric and life-history traits in lizards ({G}allotia) from the {C}anary {I}slands}, ' ...
'journal = {J. Zool. Syst. Evol. Research}, ' ...
'volume = {42}, ' ...
'pages = {44-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RodrMoli1998'; type = 'Article'; bib = [ ... 
'author = {M.A. Rodriguez-Dominguez and M. Molina-Borja}, ' ... 
'year = {1998}, ' ...
'title = {Reproduction of the endangered Hierro giant lizard \textit{Gallotia simonyi machadoi}}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {32}, ' ...
'pages = {498-504}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rome1999'; type = 'Incollection'; bib = [ ... 
'author = {M. Romero-Bevia and J.A. Mateo and V. Perez-Mellado}, ' ... 
'year = {1999}, ' ...
'title = {Morfometria y estructura en edades y sexos de la poblacion natural de \textit{Gallotia simonyi}}, ' ...
'booktitle = {El lagarto de El Hierro: Bases para su conservacion}, ' ...
'editor = {L.F. Lopez-Jurado and J.A. Mateo}, ' ...
'publisher = {Asociacion Herpetologica Espanola}, ' ...
'address = {Madrid}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'misc'; bib =  ...
'howpublished = {\url{https://eol.org/pages/794632}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


