function [data, auxData, metaData, txtData, weights] = mydata_Acanthisitta_chloris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Acanthisittidae';
metaData.species    = 'Acanthisitta_chloris'; 
metaData.species_en = 'Rifleman'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm', 'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 06 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 19];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 06];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 20;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Sher1985';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 24;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'Sher1985';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 72;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Sher1985';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'Sher1985';
data.Wwi = 7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Sher1985';
data.Wwim = 5.6;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'Sher1985';
  
data.Ri  = 4*1.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 till 5 eggs per clutch, 1 till 2 clutches per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.984	0.965
1.910	1.276
2.837	1.881
4.063	2.470
5.045	3.026
6.080	3.517
7.118	4.417
8.046	5.218
9.083	5.872
10.036	6.265
11.073	6.887
12.082	7.623
13.090	7.999
14.070	8.261
15.049	8.474
16.029	8.606
17.035	8.721
18.067	8.525
19.072	8.493
20.050	8.331
21.029	8.527
22.058	7.776
23.092	7.908
24.016	7.876];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'Sher1985';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.930	1.046
1.963	1.080
3.054	1.816
3.844	2.127
4.880	2.699
5.889	3.305
6.952	3.894
7.880	4.564
8.888	5.022
9.925	5.726
10.933	6.184
11.886	6.560
12.975	6.904
13.955	7.199
14.933	7.102
15.886	7.396
16.920	7.593
17.951	7.316
18.931	7.431
19.882	7.399
20.967	6.975
21.944	6.812
22.978	7.009
23.983	6.814];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'Sher1985';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'nestlings exceed mean adult weight at day 10 for males and 11 for females; f > 1 had been allowed to accomodate this pattern';
D3 = 'body temperature has been guessed';
D4 = 'mod_1: v is reduced and food availability is taken variable in tW data';
D5 = 'mod_2: males have equal state variables at b, compared to females';
D6 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6);  

%% Facts
F1 = 'Helpers for caring nestlings are frequently around';
metaData.bibkey.F1 = 'Sher1985'; 
F2 = 'Males spend half as much time in incubation than females, spend equal time in brooding nestlings (12 d period), but contribute more to feeding nestlings;';
metaData.bibkey.F2 = 'Sher1985'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '8TTX'; % Cat of Life
metaData.links.id_ITIS = '558372'; % ITIS
metaData.links.id_EoL = '915638'; % Ency of Life
metaData.links.id_Wiki = 'Acanthisitta_chloris'; % Wikipedia
metaData.links.id_ADW = 'Acanthisitta_chloris'; % ADW
metaData.links.id_Taxo = '56235'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '7D5E37D94F5EBA80'; % avibase
metaData.links.id_birdlife = 'rifleman-acanthisitta-chloris'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthisitta_chloris}}';
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
bibkey = 'Sher1985'; type = 'Phdthesis'; bib = [ ...  
'title = {The breeding system of the {S}outh {I}sland rifleman (\emph{Acanthisitta chloris}) at {K}owhai {B}ush, {K}aikoura, {N}ew {Z}ealand}, ' ...
'school = {University of Canterbury}, ' ...
'year = {1985}, ' ...
'author = {G. H. Sherley}, ' ...
'howpublished = {\url{https://ir.canterbury.ac.nz/bitstream/handle/10092/6349/sherley_thesis.pdf?sequence=1}}'];
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

