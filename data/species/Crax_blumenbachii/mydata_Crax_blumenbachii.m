function [data, auxData, metaData, txtData, weights] = mydata_Crax_blumenbachii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Cracidae';
metaData.species    = 'Crax_blumenbachii'; 
metaData.species_en = 'Red-billed curassow'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 20];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 20];

%% set data
% zero-variate data

data.ab = 32;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'SilvPais1986';   
  temp.ab = C2K(39);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 5;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SilvPais1986';   
  temp.tx = metaData.T_typical; units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'chick are able to fly at 5 d post-birth';
data.tp = 5 * 30.5;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'SilvPais1986';   
  temp.tp = metaData.T_typical; units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'age at which adult plumage starts';
data.tR = 35*30.5;         units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'SilvPais1986';
  temp.tR = metaData.T_typical; units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = metaData.T_typical; units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'max reproductive age taken from some past notes where I lost the source. ';
data.Wwb = 100;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'SilvPais1986';
data.Wwi = 3.5e3;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'EoL';
data.Ri  = 11/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'SilvPais1986';   
  temp.Ri = metaData.T_typical; units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'number of eggs by female number 2 in 1981';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.100	86.403
1.300	90.078
7.238	131.769
14.452	163.422
19.667	216.530
23.488	258.645
25.822	287.481
28.641	337.809];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = metaData.T_typical;  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'SilvPais1986';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.205	97.376
0.317	115.206
1.324	110.650
2.424	107.010
6.423	143.185
6.434	153.242
6.941	113.479
9.558	148.261
11.289	133.202
14.851	190.399
15.123	186.746
16.147	196.819
17.622	198.670
18.612	179.485
20.849	204.205
20.886	236.205
21.327	219.755
24.294	239.457
24.463	225.746
25.634	283.821
26.342	259.146
26.440	264.633
29.051	294.387
29.862	279.314
30.298	338.749
31.727	300.828];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = metaData.T_typical;  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'SilvPais1986';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '6BBXC'; % Cat of Life
metaData.links.id_ITIS = '175759'; % ITIS
metaData.links.id_EoL = '45512062'; % Ency of Life
metaData.links.id_Wiki = 'Crax_blumenbachii'; % Wikipedia
metaData.links.id_ADW = 'Crax_blumenbachii'; % ADW
metaData.links.id_Taxo = '69946'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'CB3380D4DC930DC9'; % avibase
metaData.links.id_birdlife = 'red-billed-curassow-crax-blumenbachii'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crax_blumenbachii}}';
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
bibkey = 'SilvPais1986'; type = 'Article'; bib = [ ... 
'author = {C. L. da Silveira and J. A, Pais}, ' ... 
'year = {1986}, ' ...
'title = {Breeding and hand-rearing the red-bolled currassow \emph{Crax blumenbachi} at {Rio de Janeiro Zoo}}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {24/25}, ' ...
'pages = {244-247}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/45512062}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

