function [data, auxData, metaData, txtData, weights] = mydata_Molothrus_aeneus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Icteridae';
metaData.species    = 'Molothrus_aeneus'; 
metaData.species_en = 'Bronzed cowbird';

metaData.ecoCode.climate = {'A', 'Cfa', 'BSh'};
metaData.ecoCode.ecozone = {'THn','TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tnpo'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 13];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 13];

%% set data
% zero-variate data

data.ab = 12;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Cart1986';   
  temp.tx = C2K(41.6);   units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 36;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 320;         units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(41.6);   units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 6*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 4.5;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Cart1986';
data.Wwi = 56.9;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 68.9;        units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 17/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Cart1986';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '15 to 20 eggs per season';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0       4.5
1.048	4.529
1.910	6.521
2.772	8.282
3.781	11.732
4.713	13.109
5.766	19.553
6.634	23.541
7.683	28.526
8.405	31.286
9.483	33.661
10.380	35.269
11.276	36.339
12.242	37.025];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'Cart1986';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.000	4.5
0.978	5.067
2.023	8.517
2.889	11.967
3.726	17.721
4.776	23.243
5.722	29.688
6.665	35.057
7.605	39.198
8.574	41.036
9.437	43.335
10.405	44.635
11.371	45.167];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'Cart1986';
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
D1 = 'scaled functional response in tW data turned out to vary, which has been implemented';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: males have equal state variables at b, compared to females';
D5 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);
metaData.discussion = struct('D1',D1,'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'Obligate brood parasite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '43YJF'; % Cat of Life
metaData.links.id_ITIS = '179116'; % ITIS
metaData.links.id_EoL = '45511158'; % Ency of Life
metaData.links.id_Wiki = 'Molothrus_aeneus'; % Wikipedia
metaData.links.id_ADW = 'Molothrus_aeneus'; % ADW
metaData.links.id_Taxo = '87459'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'EAEEA0934F069A51'; % avibase
metaData.links.id_birdlife = 'bronzed-cowbird-molothrus-aeneus'; % birdlife
metaData.links.id_AnAge = 'Molothrus_aeneus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Molothrus_aeneus}}';
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
bibkey = 'Cart1986'; type = 'Article'; bib = [ ...  
'title = {THE PARASITIC BEHAVIOR OF THE BRONZED COWBIRD IN {S}OUTH {T}EXAS}, ' ...
'journal = {The Condor}, ' ...
'year = {1986}, ' ...
'author = {Mitchael D. Carter}, ' ...
'volume = {88}, ' ...
'pages = {11-25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=EAEEA0934F069A51&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Molothrus_aeneus}}';
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

