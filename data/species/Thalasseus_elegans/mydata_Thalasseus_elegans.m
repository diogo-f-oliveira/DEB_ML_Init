function [data, auxData, metaData, txtData, weights] = mydata_Thalasseus_elegans
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Thalasseus_elegans'; 
metaData.species_en = 'Elegant tern'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iTht', '0iThh'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 26;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 39;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 117;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 2*365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20.9*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 26.4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 241.7;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0      26.4     % added from Wwb 
10.965	86.983
12.011	90.978
13.016	98.345
14.021	105.099
14.987	110.013
15.952	116.766
16.917	124.438
17.962	130.579
18.968	137.333
19.973	143.780
20.979	149.614
21.984	154.835
22.869	162.200
23.753	166.807
24.960	173.256
25.925	176.944
26.971	180.327
28.016	184.322
28.981	187.090
29.946	190.165
31.032	193.242
31.997	195.091
32.842	197.858
33.968	200.322
34.933	200.331];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'high-energy topsmelt'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'DahdHorn2003';
comment.tW = 'after 15 d: high-energy topsmelt';
%
data.tW0 = [ ... % time since birth (d), wet weight (g)
 0      26.4     % added from Wwb 
10.965	91.581
12.051	93.737
13.056	98.345
13.981	105.711
14.987	111.852
16.032	113.088
16.957	117.389
18.003	120.465
19.008	126.605
20.054	131.827
20.979	134.901
22.064	139.510
23.029	145.037
23.995	147.193
24.879	151.187
26.247	154.266
27.011	156.726
27.976	158.268
28.981	160.730
29.987	162.580
30.992	164.123
31.877	164.745
32.962	165.982
33.928	167.831
34.853	168.147];
units.tW0   = {'d', 'g'};  label.tW0 = {'time since birth', 'wet weight', 'low-energy topsmelt'};  
temp.tW0    = C2K(40.7);  units.temp.tW0 = 'K'; label.temp.tW0 = 'temperature';
bibkey.tW0  = 'DahdHorn2003';
comment.tW0 = 'after 15 d: low-energy topsmelt';

%% set weights for all real data
weights = setweights(data, []);
weights.tW0 = weights.tW0 * 2;
weights.tW = weights.tW * 2;

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
set1 = {'tW','tW0'}; title1 = 'Data at high, low energy topsmelt after 15 d';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {title1};

%% Discussion points
D1 = 'This entry illustrates effect of food quality';
D2 = 'mod_1: v is reduced'; 
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7C5G4'; % Cat of Life
metaData.links.id_ITIS = '176931'; % ITIS
metaData.links.id_EoL = '45509313'; % Ency of Life
metaData.links.id_Wiki = 'Thalasseus_elegans'; % Wikipedia
metaData.links.id_ADW = 'Thalasseus_elegans'; % ADW
metaData.links.id_Taxo = '610052'; % Taxonomicon
metaData.links.id_WoRMS = '225959'; % WoRMS
metaData.links.id_avibase = '3F9E1C51FBD48FC1'; % avibase
metaData.links.id_birdlife = 'elegant-tern-thalasseus-elegans'; % birdlife
metaData.links.id_AnAge = 'Thalasseus_elegans'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thalasseus_elegans}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Thalasseus_elegans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DahdHorn2003'; type = 'Article'; bib = [ ... 
'author = {W. M. Dahdul and M. H. Horn}, ' ... 
'year = {2003}, ' ...
'title = {Energy allocation and postnatal growth in captive elegant tern (\emph{Sterna elegans} chicks: resposes to high- versus low-energy diets)}, ' ...
'journal = {The Auk}, ' ...
'volume = {120}, ' ...
'pages = {1069-1081}'];
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

