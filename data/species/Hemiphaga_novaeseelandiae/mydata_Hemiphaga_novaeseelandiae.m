function [data, auxData, metaData, txtData, weights] = mydata_Hemiphaga_novaeseelandiae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Columbiformes'; 
metaData.family     = 'Columbidae';
metaData.species    = 'Hemiphaga_novaeseelandiae'; 
metaData.species_en = 'New Zealand pigeon'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.63); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 28.5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(37.85); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '28 to 29 d';
data.tx = 37;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40.63); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '30 to 45 d';
data.tp = 111;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.63); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40.63); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40.63); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on similar sized pegions in AnAge';

data.Wwb = 18.6;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on extrapolation to hatch';
data.Wwi = 590;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = ' 550 to850 g';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40.63); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 eggs/clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
5.460	88.571
5.580	75.531
6.300	140.770
7.380	153.846
8.280	153.873
8.400	255.326
9.300	265.498
10.440	120.605
10.441	191.620
11.400	185.851
11.580	238.031
12.360	306.170
12.420	193.129
12.421	225.013
13.320	288.808
14.400	222.174
14.460	314.929
15.300	248.288
15.360	290.319
15.420	303.364
15.421	362.784
16.260	270.056
16.561	348.326
17.520	359.949
17.521	370.094
17.522	388.935
17.580	329.516
18.420	342.585
18.480	299.109
19.500	404.937
20.220	329.596
21.180	331.074
21.420	449.922
21.480	406.446
22.320	400.674
22.380	447.053
23.340	374.618
23.400	447.083
23.520	515.203
24.360	383.344
25.500	429.755
25.620	564.542
26.460	500.799
26.640	561.674
27.420	477.640
27.600	516.775
28.320	528.391
28.321	515.348
29.340	497.987
30.420	435.701
30.840	570.496
31.500	518.342
32.580	529.969
32.640	595.188
33.360	561.877
34.380	480.748
34.560	586.551
36.360	480.808
37.380	480.839
37.440	602.580
39.660	530.183
46.440	581.112
48.300	628.995];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.63);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'ThorInne2004';

%% set weights for all real data
weights = setweights(data, []);
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

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3KRM5'; % Cat of Life
metaData.links.id_ITIS = '177395'; % ITIS
metaData.links.id_EoL = '1049942'; % Ency of Life
metaData.links.id_Wiki = 'Hemiphaga_novaeseelandiae'; % Wikipedia
metaData.links.id_ADW = 'Hemiphaga_novaeseelandiae'; % ADW
metaData.links.id_Taxo = '54075'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '0A127E49E9FB6263'; % avibase
metaData.links.id_birdlife = 'new-zealand-pigeon-hemiphaga-novaeseelandiae'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hemiphaga_novaeseelandiae}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Caloenas_nicobarica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ThorInne2004'; type = 'Article'; bib = [ ...
'author = {M. Thorson and J. Innes and G. Nugent and K. Prime},'...
'year = {2004}, ' ...
'title = {Parental care and growth rates of {N}ew {Z}ealand pigeon (\emph{Hemiphaga novaeseelandiae}) nestlings}, ' ...
'journal = {Notornis}, ' ...
'volume = {5}, ' ...
'pages = {136-140}'];
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

