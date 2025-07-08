function [data, auxData, metaData, txtData, weights] = mydata_Aythya_americana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Aythya_americana'; 
metaData.species_en = 'Redhead'; 

metaData.ecoCode.climate = {'Cfb', 'Dfc', 'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'biFp', 'biFm'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'biCim', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wwe'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 07 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 26;   units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'ADW';   
  temp.ab = C2K(36.65);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps from Rahn1991, see Anas_platyrhynchos; ab ranges from 24 till 28 d';
data.tx = 65;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ADW';   
  temp.tx = C2K(41.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'between 55 and 75 d';
data.tp = 195;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 22.6*365;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 37.6;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'AnAge';
data.Wwi = 1245; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';       bibkey.Wwi = 'EOL';
data.Wwi_m = 1320; units.Wwi_m = 'g';   label.Wwi_m = 'ultimate wet weight for male';    bibkey.Wwi_m = 'EOL';

data.Ri  = 13/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(41.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr; Wiki gives 5-7 eggs and mentions brood parasitism';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time (wk), wet weight (g)
0.108	40.713
0.938	83.416
1.959	146.774
2.919	258.912
4.007	371.027
4.968	500.898
5.993	630.758
6.971	683.780
8.031	651.072
9.007	656.803
9.985	689.134
12.001	693.195
16.038	810.676];
data.tW_f(:,1) = data.tW_f(:,1) * 7; % convert wk to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Well1957';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (wk), wet weight (g)
0.108	48.102
0.959	93.757
1.939	171.901
2.942	286.987
3.945	409.462
4.971	571.834
5.974	689.875
7.017	763.574
8.034	729.396
9.032	730.690
9.988	763.025
11.942	789.265
16.021	899.349]; 
data.tW_m(:,1) = data.tW_m(:,1) * 7; % convert wk to d
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Well1957';
comment.tW_m = 'Data for males';
%
data.tW_e = [ ...
3.901	0.369
4.291	0.423
6.018	0.525
7.968	0.627
8.248	0.736
8.638	0.734
9.977	1.060
11.994	2.378
11.997	2.709
11.999	2.875
12.003	3.262
14.012	3.695
15.980	5.732
16.055	7.778
16.278	7.776
16.723	7.774
18.052	12.745
20.010	19.537
20.026	27.056
20.054	18.375
22.114	24.116
22.164	23.508
23.924	32.955];
units.tW_e   = {'d', 'g'};  label.tW_e = {'age', 'wet weight'};  
temp.tW_e    = C2K(36.65);  units.temp.tW_e = 'K'; label.temp.tW_e = 'temperature';
bibkey.tW_e = 'Well1957';
subtitle.tW_e = 'Embryo development';
  
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
txtData.subtitle = subtitle;

%% Group plots
set1 = {'tW_f', 'tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'K56P'; % Cat of Life
metaData.links.id_ITIS = '175125'; % ITIS
metaData.links.id_EoL = '45510576'; % Ency of Life
metaData.links.id_Wiki = 'Aythya_americana'; % Wikipedia
metaData.links.id_ADW = 'Aythya_americana'; % ADW
metaData.links.id_Taxo = '52209'; % Taxonomicon
metaData.links.id_WoRMS = '159162'; % WoRMS
metaData.links.id_avibase = '3072CC168280168B'; % avibase
metaData.links.id_birdlife = 'redhead-aythya-americana'; % birdlife
metaData.links.id_AnAge = 'Aythya_americana'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aythya_americana}}';
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
bibkey = 'Well1957'; type = 'Article'; bib = [ ... 
'author = {M. W. Weller}, ' ... 
'year = {1957}, ' ...
'title = {GROWTH, WEIGHTS, AND PLUMAGES OF THE REDHEAD, \emph{Aythya americana}}, ' ...
'journal = {The Wilson Bulletin}, ' ...
'volume = {69}, ' ..., 
'number = {1}, ' ...
'pages = {5--38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Aythya_americana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Aythya_americana/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EOL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.eol.org/pages/1048964/overview/}}';
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

